# frozen_string_literal: true

require 'minitest/reporters'
Minitest::Reporters.use!

require 'minitest/stub_any_instance'

require 'minitest/autorun'

class TestCustomProduct < Minitest::Test
  def test_update
    assert_raises(Teemill::InvalidRequestError) { Teemill::CustomProduct.update(1, {}) }
  end

  def test_create_with_no_api_key
    assert_raises(Teemill::MissingLegacyCredentialsError) { Teemill::CustomProduct.create({}) }
  end

  def test_authenticates_with_bearer_token
    Teemill.legacy_api_key = 'charmander'

    custom_product = Teemill::CustomProduct.new
    headers = custom_product.authenticated_request_headers

    assert_match headers[:Authorization], 'Bearer charmander'
    Teemill.legacy_api_key = nil
  end

  def test_can_create_custom_products
    require 'gbro_teemill'

    Teemill::CustomProduct.stub_any_instance(:send_request, create_response) do
      Teemill.legacy_api_key = 'example'
      custom_product = Teemill::CustomProduct.create({})

      assert_instance_of(Teemill::CustomProduct, custom_product)
      assert_equal(123_456, custom_product.id)

      Teemill.legacy_api_key = nil
    end
  end

  def create_response
    {
      id: 123_456,
      url: 'https://mystore.teemill.com/product-url-name',
      image: 'https://images.teemill.com/<image-url>',
      colours: {
        White: 'https://images.teemill.com/<image-url>',
        Black: 'https://images.teemill.com/<image-url>'
      },
      name: 'Custom Product',
      price: {
        gbp: '19.00'
      }
    }
  end
end
