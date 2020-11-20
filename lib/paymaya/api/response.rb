# frozen_string_literal: true

module PayMaya
  module API
    # Response builder
    class Response
      attr_reader :hash_body, :api_code, :error

      def initialize(response:, api_code:)
        @api_code = api_code
        @hash_body = JSONHash.parse(response.body)
        return if response.is_a?(Net::HTTPSuccess)

        @error = Error.new(api_code: api_code,
                           error: @hash_body['message'] || @hash_body['error'],
                           code: response.code)
      rescue JSONHash::Error => e
        @error = Error.new(api_code: api_code,
                           error: e.message,
                           code: response.code)
      end

      def success?
        @success ||= error.nil?
      end
    end
  end
end
