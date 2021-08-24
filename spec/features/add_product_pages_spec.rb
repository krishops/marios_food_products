require 'rails_helper'

describe "the add a product process" do

  before(:each) do
    Product.destroy_all
    admin = User.create(:email => "admin@test.com", :password => "password", admin: true)
    visit signin_path
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
    visit new_product_path
  end

  it "adds a new product" do
    # click_link 'Add new product'
    fill_in 'Name', :with => 'lasagna'
    fill_in 'Cost', :with => '9.99'
    fill_in 'Country of origin', :with => 'Italy'
    click_on 'Create Product'
    expect(page).to have_content 'Product Added'
    expect(page).to have_content 'Lasagna'
  end

  it "gives an error when no name, cost, or country is entered" do
    # click_link 'Add new product'
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
  end
end