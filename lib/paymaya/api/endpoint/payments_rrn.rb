# frozen_string_literal: true

module PayMaya
  module API
    module Endpoint
      # Get Payments via Request Reference Number
      # https://hackmd.io/@paymaya-pg/Checkout#Get-Payments-via-RRN---GET-httpspg-sandboxpaymayacompaymentsv1payment-rrnsrrn
      class PaymentsRRN
        attr_reader :rrn
        def initialize(rrn:)
          @rrn = rrn
        end

        def code
          1
        end

        def endpoint(version:)
          "/payments/#{version}/payment-rrns/#{rrn}"
        end
      end
    end
  end
end
