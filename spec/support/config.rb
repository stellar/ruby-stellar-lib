# frozen_string_literal: true

require 'yaml'

CONFIG = YAML.load_file(SPEC_ROOT.join('config.yml')).with_indifferent_access
