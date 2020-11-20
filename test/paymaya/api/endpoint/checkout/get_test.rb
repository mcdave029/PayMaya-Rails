require 'test_helper'

describe PayMaya::API::Endpoint::Checkout::Get do
  it 'should have error for invalid request_reference_number' do
    secret_key = 'sk-X8qolYjy62kIzEbr0QRK1h4b4KDVHaNcwMYk39jInSl'
    client = PayMaya::API::Client.new(secret_key: secret_key)
    checkout_id = '0a812155-c6c5-44c0-a803-5585ee29fbe9'
    api = PayMaya::API::Endpoint::Checkout::Get.new(checkout_id: checkout_id)
    VCR.use_cassette('checkout_get_success') do
      res = client.get(api: api)
      assert res.success?
      assert_equal res.hash_body['id'], checkout_id
    end
  end
end
