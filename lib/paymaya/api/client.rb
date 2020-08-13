# frozen_string_literal: true

require 'base64'
require 'json'
require 'net/http'

module PayMaya
  module API
    # Client class for initializing api requests
    class Client
      PRODUCTION_BASE_URL = 'https://pg.paymaya.com'
      STAGING_BASE_URL = 'https://pg-sandbox.paymaya.com'

      attr_reader :key, :version, :sandbox
      def initialize(key:, version: 'v1', sandbox: true)
        @key = key
        @version = version
        @sandbox = sandbox
      end

      def get(api:)
        uri = build_uri(api: api)
        request = Net::HTTP::Get.new(uri)
        Response.new(
          response: start(request: request, uri: uri),
          api_code: api.code
        )
      end

      private

      def base_url
        @base_url ||= sandbox ? STAGING_BASE_URL : PRODUCTION_BASE_URL
      end

      def build_uri(api:)
        URI.parse(base_url + api.endpoint(version: version))
      end

      def token
        @token ||= Base64.strict_encode64("#{key}:")
      end

      def start(request:, uri:)
        options = { use_ssl: uri.scheme == 'https' }

        request.add_field('Content-Type', 'application/json')
        request.add_field('Authorization', "Basic #{token}")

        Net::HTTP.start(uri.hostname, uri.port, options) do |http|
          http.request(request)
        end
      end
    end
  end
end
