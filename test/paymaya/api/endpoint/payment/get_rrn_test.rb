require 'test_helper'

describe PayMaya::API::Endpoint::Payment::GetRRN do
  it 'should have error for invalid request_reference_number' do
    secret_key = 'sk-X8qolYjy62kIzEbr0QRK1h4b4KDVHaNcwMYk39jInSl'
    client = PayMaya::API::Client.new(secret_key: secret_key)
    api = PayMaya::API::Endpoint::Payment::GetRRN.new(rrn: 'SampleRRN')
    VCR.use_cassette('payments_rrn_invalid_rrn') do
      res = client.get(api: api)
      refute res.success?
      refute_nil res.error
      assert_equal res.error.message, 'There seems to be a problem. Please try again later. [PayMayaError#1]'
      assert_equal res.error.actual_error_message, 'Payment does not exist.'
      assert_equal res.error.actual_error_code, '404'
    end
  end
end
