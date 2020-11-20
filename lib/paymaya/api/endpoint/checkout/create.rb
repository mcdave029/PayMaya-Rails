# frozen_string_literal: true

module PayMaya
  module API
    module Endpoint
      module Checkout
        # Create checkout URL
        # https://hackmd.io/@paymaya-pg/Checkout#Create-Checkout-Payment---POST-httpspg-sandboxpaymayacomcheckoutv1checkouts
        class Create
          attr_reader :body
          def initialize(params:)
            @body = params
          end

          def code
            2
          end

          def required_key
            :public_key
          end

          def endpoint(version:)
            "/checkout/#{version}/checkouts"
          end
        end
      end
    end
  end
end
