require 'rails_helper'

describe "the delete a product process" do

  before(:each) do
    Product.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
  end

  it "deletes a product" do
    visit product_path(@product)
    click_link 'Delete Product'
    accept_alert do
      click_link('OK')
    end
    expect(page).to have_no_content 'Spaghetti'
  end
end