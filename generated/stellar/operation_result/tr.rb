# Automatically generated on 2015-05-13T15:00:04-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   union switch (OperationType type)
#       {
#       case CREATE_ACCOUNT:
#           CreateAccountResult createAccountResult;
#       case PAYMENT:
#           PaymentResult paymentResult;
#       case PATH_PAYMENT:
#           PathPaymentResult pathPaymentResult;
#       case CREATE_OFFER:
#           CreateOfferResult createOfferResult;
#       case SET_OPTIONS:
#           SetOptionsResult setOptionsResult;
#       case CHANGE_TRUST:
#           ChangeTrustResult changeTrustResult;
#       case ALLOW_TRUST:
#           AllowTrustResult allowTrustResult;
#       case ACCOUNT_MERGE:
#           AccountMergeResult accountMergeResult;
#       case INFLATION:
#           InflationResult inflationResult;
#       }
#
# ===========================================================================
module Stellar
  class OperationResult
    class Tr < XDR::Union
      switch_on OperationType, :type

      switch :create_account, :create_account_result
      switch :payment,        :payment_result
      switch :path_payment,   :path_payment_result
      switch :create_offer,   :create_offer_result
      switch :set_options,    :set_options_result
      switch :change_trust,   :change_trust_result
      switch :allow_trust,    :allow_trust_result
      switch :account_merge,  :account_merge_result
      switch :inflation,      :inflation_result

      attribute :create_account_result, CreateAccountResult
      attribute :payment_result,        PaymentResult
      attribute :path_payment_result,   PathPaymentResult
      attribute :create_offer_result,   CreateOfferResult
      attribute :set_options_result,    SetOptionsResult
      attribute :change_trust_result,   ChangeTrustResult
      attribute :allow_trust_result,    AllowTrustResult
      attribute :account_merge_result,  AccountMergeResult
      attribute :inflation_result,      InflationResult
    end
  end
end