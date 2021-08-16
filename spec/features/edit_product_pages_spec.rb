require 'rails_helper'

describe "the edit a product process" do

  before(:each) do
    Product.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
  end

  it "edits a product" do
    visit product_path(@product)
    click_link 'Edit Product'
    fill_in 'Name', :with => 'Bratwurst'
    fill_in 'Cost', :with => '10.01'
    fill_in 'Country of origin', :with => 'Germany'
    click_on 'Update Product'
    expect(page).to have_content 'Product Updated'
    expect(page).to have_content 'Bratwurst'
    expect(page).to have_content '$10.01'
    expect(page).to have_content 'Germany'
  end
end