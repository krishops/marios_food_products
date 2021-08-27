require 'rails_helper'

describe "the delete a review process" do

  before(:all) do
    Product.destroy_all
    Review.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    @review = Review.create({author: "Jane Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscin", rating: 4, product_id: @product.id})
    @user = User.create({:email => "fake@test.com", :password => "example", :password_confirmation => "example", :admin => true})
    @user = User.create({:email => "fake@user.com", :password => "password", :password_confirmation => "password"})
  end

  it "deletes review" do
    visit signin_path
    fill_in 'email', :with => 'fake@test.com'
    fill_in 'password', :with => 'example'
    click_on 'commit'
    visit product_review_path(@product, @review)
    click_link 'Delete review'
    expect(page).to have_no_content 'Jane Doe'
    expect(page).to have_no_content 'Lorem ipsum dolor sit amet, consectetuer adipiscin'
    expect(page).to have_no_content '4'
  end

  it "requires admin to delete a review" do
    visit signin_path
    fill_in 'email', :with => 'fake@user.com'
    fill_in 'password', :with => 'password'
    click_on 'commit'
    visit product_review_path(@product, @review)
    click_link 'Delete review'
    expect(page). to have_content "You aren't authorized to visit this page"
  end
end