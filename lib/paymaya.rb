# frozen_string_literal: true

# require 'pay_maya_rails/engine'

module PayMaya
  # API
  module API
    autoload :Client, 'paymaya/api/client'
    autoload :Response, 'paymaya/api/response'
    autoload :Error, 'paymaya/api/error'

    # Endpoints
    module Endpoint
      autoload :PaymentsRRN, 'paymaya/api/endpoint/payments_rrn'
    end
  end
end
