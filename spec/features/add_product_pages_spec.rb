require 'rails_helper'

describe "the add a product process" do


  it "adds a new product" do
    visit products_path
    click_link 'Add new product'
    fill_in 'Name', :with => 'lasagna'
    fill_in 'Cost', :with => '9.99'
    fill_in 'Country of origin', :with => 'Italy'
    click_on 'Create Product'
    expect(page).to have_content 'Product Added'
    expect(page).to have_content 'Lasagna'
  end

  it "gives an error when no name, cost, or country is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
  end
end