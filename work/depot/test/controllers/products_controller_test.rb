require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The Great Book #{rand(1000)}"

  end


  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end


  test "should create product" do
    assert_difference("Product.count") do

    post products_url, params: {
        product: {
          description: @product.description,
          image_url: @product.image_url,
          price: @product.price,
          title: @title,
        }
      }

    end

    assert_redirected_to product_url(Product.last)
  end


  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end


  test "should update product" do

    patch product_url(@product), params: {
        product: {
          description: @product.description,
          image_url: @product.image_url,
          price: @product.price,
          title: @title,
        }
      }

    assert_redirected_to product_url(@product)
  end


  test "can't delete product in cart" do
    product = products(:two) # Get the product from fixtures

    assert_difference("Product.count", 0) do
      delete product_url(product)
    end

    # Reload the product to check its state after the delete attempt
    product.reload

    # Assert that the product still exists
    assert Product.exists?(product.id)

    # Assert that the product has errors
    assert_not_empty product.errors[:base]
    assert_equal 'Line Items present', product.errors[:base].first

    assert_redirected_to products_url
  end


  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end