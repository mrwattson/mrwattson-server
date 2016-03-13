require File.expand_path('../../boot.rb', __FILE__)
require 'rack/test'
require 'json'

module Requests
  # Quick helper to keep specs DRY by avoiding too many JSON.parse
  module Helpers
    def json
      @json ||= JSON.parse(last_response.body)
    end
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.warnings = false

  config.include Requests::Helpers, type: :request

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 10
  config.order = :random

  Kernel.srand config.seed
end

Dir['./spec/endpoints/shared_examples/*.rb'].sort.each { |file| require file }
Dir['./spec/support/*.rb'].sort.each { |file| require file }

# Disable active record logger
ActiveRecord::Base.logger = nil
