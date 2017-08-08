require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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


  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    #  VERIFY
    expect(page).to have_css 'article.product', count: 10
  end

  scenario "They click add to cart and MyCart should change from 0 to 1" do
    # ACT
    visit root_path

    first('article').find('footer').first('a').click
    sleep(5)

    # DEBUG
    save_screenshot

    #  VERIFY
    within('nav') do
      expect(page).to have_content 'My Cart (1)'
    end
  end

end