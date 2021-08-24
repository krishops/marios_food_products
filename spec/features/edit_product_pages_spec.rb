require 'rails_helper'

describe "the edit a product process" do

  before(:each) do
    Product.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    admin = User.create(:email => "admin@test.com", :password => "password", admin: 'true')
    visit signin_path
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
  end

  it "edits a product" do
    visit edit_product_path(@product)
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