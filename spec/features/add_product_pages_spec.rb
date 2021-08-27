require 'rails_helper'

describe "the add a product process" do

  before(:each) do
    Product.destroy_all
    @admin = User.create({:email => "fake@test.com", :password => "example", :password_confirmation => "example", :admin => true})
    @user = User.create({:email => "fake@user.com", :password => "password", :password_confirmation => "password"})
  end

  it "adds a new product" do
    visit signin_path
    fill_in 'email', :with => 'fake@test.com'
    fill_in 'password', :with => 'example'
    click_on 'commit'
    visit new_product_path
    fill_in 'product[name]', :with => 'lasagna'
    fill_in 'product[cost]', :with => '9.99'
    fill_in 'product[country_of_origin]', :with => 'Italy'
    click_on 'Create Product'
    expect(page).to have_content 'Product Added'
    expect(page).to have_content 'Lasagna'
  end

  it "gives an error when no name, cost, or country is entered" do
    visit signin_path
    fill_in 'email', :with => 'fake@test.com'
    fill_in 'password', :with => 'example'
    click_on 'commit'
    visit new_product_path
    click_on 'commit'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Cost can't be blank"
    expect(page).to have_content "Country of origin can't be blank"
  end

  it "requires login to access add product page" do
    visit new_product_path
    expect(page).to have_content "You aren't authorized to visit this page"
  end

  it "requires admin login to access add product page" do
    visit signin_path
    fill_in 'email', :with => 'fake@user.com'
    fill_in 'password', :with => 'password'
    click_on 'commit'
    visit new_product_path
    expect(page).to have_content "You aren't authorized to visit this page"
  end
end