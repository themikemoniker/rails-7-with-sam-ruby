require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product is not valid without a unique title" do
    product = Product.new(
      title: products(:ruby).title,
      description: "good book",
      price: 4.40,
      image_url: "maapis.jpg"
    )
    assert product.invalid?
    # assert_equal ["has already been taken"], product.errors[:title]
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
