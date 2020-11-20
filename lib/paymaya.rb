# frozen_string_literal: true

# require 'pay_maya_rails/engine'

module PayMaya
  # API
  module API
    autoload :Client, 'paymaya/api/client'
    autoload :Response, 'paymaya/api/response'
    autoload :Error, 'paymaya/api/error'
    autoload :JSONHash, 'paymaya/api/json_hash'

    # Endpoints
    module Endpoint
      # Payments
      module Payment
        autoload :GetRRN, 'paymaya/api/endpoint/payment/get_rrn'
      end

      # Checkouts
      module Checkout
        autoload :Create, 'paymaya/api/endpoint/checkout/create'
        autoload :Get, 'paymaya/api/endpoint/checkout/get'
      end
    end
  end
end
