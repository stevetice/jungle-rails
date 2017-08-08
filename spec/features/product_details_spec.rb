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


  scenario "They see the products on the homepage" do
    # ACT
    visit root_path

    first


    # DEBUG
    save_screenshot

    #  VERIFY
    expect(page).to have_css 'article.product', count: 10
  end


  scenario "They click the first product" do
    # ACT
    visit root_path

    first('article').find('header').find('a').click
    sleep(5)

    # DEBUG
    save_screenshot

    #  VERIFY
    expect(page).to have_css 'article.reviews-show'
  end


end