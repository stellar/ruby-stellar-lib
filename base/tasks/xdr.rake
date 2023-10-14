namespace :xdr do
  xdr_defs = FileList[
    "Stellar-types.x",
    "Stellar-contract.x",
    "Stellar-contract-config-setting.x",
    "Stellar-contract-env-meta.x",
    "Stellar-contract-meta.x",
    "Stellar-contract-spec.x",
    "Stellar-ledger-entries.x",
    "Stellar-transaction.x",
    "Stellar-ledger.x",
    "Stellar-overlay.x",
    "Stellar-SCP.x",
    "Stellar-internal.x",
  ]

  task :update, [:ref] => [:clean, :generate]
  task generate: "generated/stellar-base-generated.rb"

  directory "xdr"
  directory "generated"

  file "generated/stellar-base-generated.rb" => xdr_defs do |t|
    require "xdrgen"

    compilation = Xdrgen::Compilation.new(
      t.sources.map { "xdr/#{_1}" },
      output_dir: "generated",
      namespace: "stellar-base-generated",
      language: :ruby
    )
    IO.write("Stellar.x", compilation.source)
    compilation.compile
  end

  rule ".x", [:ref] => ["xdr"] do |t, args|
    args.with_defaults(ref: :curr)
    core_file = github_client.contents("stellar/stellar-xdr", path: t.name, ref: args.ref)
    IO.write("xdr/#{t.name}", core_file.rels[:download].get.data)
  end

  # https://github.com/stellar/stellar-xdr/archive/refs/heads/curr.zip
  task :clean do
    rm_rf "xdr"
    rm_rf "generated"
  end

  def github_client
    return @github_client if defined?(@github_client)
    require "octokit"
    @github_client = Octokit::Client.new(netrc: true)
  end
end
