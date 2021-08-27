require 'rails_helper'

describe "the delete a product process" do

  before(:each) do
    Product.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    @admin = User.create({:email => "fake@test.com", :password => "example", :password_confirmation => "example", :admin => true})
    @user = User.create({:email => "fake@user.com", :password => "password", :password_confirmation => "password"})
  end

  it "deletes a product" do
    visit signin_path
    fill_in 'email', :with => 'fake@test.com'
    fill_in 'password', :with => 'example'
    click_on 'commit'
    visit product_path(@product)
    click_link 'Delete Product'
    expect(page).to have_no_content 'Spaghetti'
  end

  it "requires admin to delete a product" do
    visit signin_path
    fill_in 'email', :with => 'fake@user.com'
    fill_in 'password', :with => 'password'
    click_on 'commit'
    visit product_path(@product)
    expect(page). to have_no_content "Delete Product"
  end
end