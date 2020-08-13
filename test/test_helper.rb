require "minitest/autorun"

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

# Filter out the backtrace from minitest while preserving the one from other libraries.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
