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

      attr_reader :secret_key, :public_key, :version, :sandbox
      def initialize(secret_key: nil, public_key: nil, version: 'v1', sandbox: true)
        @secret_key = secret_key
        @public_key = public_key
        @version = version
        @sandbox = sandbox
      end

      def get(api:)
        uri = build_uri(api: api)
        token = generate_token(api: api)
        request = Net::HTTP::Get.new(uri)
        Response.new(
          response: start(request: request, uri: uri, token: token),
          api_code: api.code
        )
      end

      def post(api:)
        uri = build_uri(api: api)
        token = generate_token(api: api)
        request = Net::HTTP::Post.new(uri)
        request.body = api.body.to_json
        Response.new(
          response: start(request: request, uri: uri, token: token),
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

      def generate_token(api:)
        key = case api.required_key
              when :public_key then public_key
              when :secret_key then secret_key
              end
        Base64.strict_encode64("#{key}:")
      end

      def start(request:, uri:, token:)
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
