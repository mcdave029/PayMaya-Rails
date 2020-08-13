require 'minitest/autorun'
require 'vcr'
require 'paymaya'

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

VCR.configure do |config|
  config.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  config.hook_into :webmock
end
