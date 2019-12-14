require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "Programming Ruby",
      description: "Pikage",
      image_url: "ruby.jpg",
      price: -1,
    )

    assert product.invalid?

    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(
      title: "My Book Title",
      description: "Some description",
      image_url: image_url,
      price: 1,
    )
  end

  test "image_url when create new product" do
    ok = %w{thang.gif thang.jpg thang.png THANG.jpg THANG.PNG thang.GIF thang.JpG}

    bad = %w{thang.doc thang.jpg/more thang.png.old}

    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn't be invalid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end

  test "unique title" do
    product = Product.new(
      title:        products(:ruby).title,
      description:  "Some description",
      image_url:    "ruby.jpg",
      price:        12.34
    )

    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "unique title - i18n" do
    product = Product.new(
      title:        products(:ruby).title,
      description:  "Some description",
      image_url:    "ruby.jpg",
      price:        12.34
    )

    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end
end
