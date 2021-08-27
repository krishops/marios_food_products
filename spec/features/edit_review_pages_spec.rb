require 'rails_helper'

describe "the edit a review process" do

  before(:all) do
    Product.destroy_all
    Review.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    @review = Review.create({author: "Jane Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscin", rating: 4, product_id: @product.id})
    @admin = User.create({:email => "fake@test.com", :password => "example", :password_confirmation => "example", :admin => true})
    @user = User.create({:email => "fake@user.com", :password => "password", :password_confirmation => "password"})
  end

  it "edits a review" do
    visit signin_path
    fill_in 'email', :with => 'fake@test.com'
    fill_in 'password', :with => 'example'
    click_on 'commit'
    visit product_review_path(@product, @review)
    click_link 'Edit review'
    fill_in 'Author', :with => 'Jill Doe'
    fill_in 'Content body', :with => 'Lorem ipsum dolor sit amet, consectetuer new update to review'
    fill_in 'Rating', :with => 3
    click_on 'Update Review'
    expect(page).to have_content 'Jill Doe'
    expect(page).to have_content 'Lorem ipsum dolor sit amet, consectetuer new update to review'
    expect(page).to have_content '3'
  end

  it "requires login to access edit review page" do
    visit product_review_path(@product, @review)
    expect(page).to have_content "You must be logged in to access this page"
  end

  it "requires admin login to access edit review page" do
    visit signin_path
    fill_in 'email', :with => 'fake@user.com'
    fill_in 'password', :with => 'password'
    click_on 'commit'
    visit product_review_path(@product, @review)
    click_on 'Edit review'
    expect(page).to have_content "You aren't authorized to visit this page"
  end
end