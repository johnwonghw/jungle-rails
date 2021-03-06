require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click on the details button which directs to a products page and see product details" do
    visit '/'
    first('article.product').find_link('Details').click
    expect(page).to have_css('section.products-show')
  end

  scenario "Click on the product image which directs to a products page and see product details" do
    visit '/'
    first('article.product a').click
    expect(page).to have_css('section.products-show')
  end

end
