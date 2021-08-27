require 'rails_helper'

describe "the edit a product process" do

  before(:each) do
    Product.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    @admin = User.create({:email => "fake@test.com", :password => "example", :password_confirmation => "example", :admin => true})
    @user = User.create({:email => "fake@user.com", :password => "password", :password_confirmation => "password"})
  end

  it "edits a product" do
    visit signin_path
    fill_in 'email', :with => 'fake@test.com'
    fill_in 'password', :with => 'example'
    click_on 'commit'
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

  it "requires login to access edit product page" do
    visit edit_product_path(@product)
    expect(page).to have_content "You aren't authorized to visit this page"
  end

  it "requires admin login to access edit product page" do
    visit signin_path
    fill_in 'email', :with => 'fake@user.com'
    fill_in 'password', :with => 'password'
    click_on 'commit'
    visit edit_product_path(@product)
    expect(page).to have_content "You aren't authorized to visit this page"
  end
end