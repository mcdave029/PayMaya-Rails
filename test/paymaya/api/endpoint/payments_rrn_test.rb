require 'test_helper'

describe PayMaya::API::Endpoint::PaymentsRRN do
  it 'should have error for invalid request_reference_number' do
    secret_key = 'sk-X8qolYjy62kIzEbr0QRK1h4b4KDVHaNcwMYk39jInSl'
    client = PayMaya::API::Client.new(key: secret_key)
    api = PayMaya::API::Endpoint::PaymentsRRN.new(rrn: 'SampleRRN')
    VCR.use_cassette('payments_rrn_invalid_rrn') do
      res = client.get(api: api)
      refute_nil res.error
      assert_equal res.error.message, 'There seems to be a problem. Please try again later. [PayMayaError#1]'
      assert_equal res.error.actual_error_message, 'Payment does not exist.'
      assert_equal res.error.actual_error_code, 'PY0009'
    end
  end
end
