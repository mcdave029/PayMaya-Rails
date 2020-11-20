# frozen_string_literal: true

module PayMaya
  module API
    module Endpoint
      module Checkout
        # Get checkout details
        # https://hackmd.io/@paymaya-pg/Checkout#Get-Checkout---GET-httpspg-sandboxpaymayacomcheckoutv1checkoutscheckoutId
        class Get
          attr_reader :checkout_id
          def initialize(checkout_id:)
            @checkout_id = checkout_id
          end

          def code
            2
          end

          def required_key
            :secret_key
          end

          def endpoint(version:)
            "/checkout/#{version}/checkouts/#{checkout_id}"
          end
        end
      end
    end
  end
end
