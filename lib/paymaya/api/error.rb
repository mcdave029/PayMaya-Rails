# frozen_string_literal: true

module PayMaya
  module API
    # Error class for specific for APIs
    class Error < StandardError
      DEFAULT_ERROR = 'There seems to be a problem. Please try again later.'

      attr_reader :actual_error_message, :actual_error_code, :exception_message

      def initialize(api_code:, error:, code:)
        @actual_error_message = error
        @actual_error_code = code
        super("#{DEFAULT_ERROR} [PayMayaError##{api_code}]")
      end
    end
  end
end
