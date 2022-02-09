require 'rails_helper'

RSpec.feature "Visitor clicks add to cart and cart increases by one", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        image: open_asset('apparel1.jpg'),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
    )
    end
  end

  scenario "They can add product to cart" do
    # ACT
    visit root_path

    # CLICK ON
    first('.btn-default').click

    # commented out b/c it's for debugging only
    save_and_open_screenshot

    # VERIFY
    expect(page).to have_content('My Cart (1)')
  end
end