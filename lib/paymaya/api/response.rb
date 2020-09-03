# frozen_string_literal: true

module PayMaya
  module API
    # Response builder
    class Response
      attr_reader :hash_body, :api_code, :error

      def initialize(response:, api_code:)
        @api_code = api_code
        @hash_body = JSON.parse(response.body)
        return if response.is_a?(Net::HTTPSuccess)

        @error = Error.new(api_code: api_code,
                           error: @hash_body['message'] || @hash_body['error'],
                           code: @hash_body['code'])
      end

      def success?
        @success ||= error.nil?
      end
    end
  end
end
