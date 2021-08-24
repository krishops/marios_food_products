require 'rails_helper'

describe "the edit a review process" do

  before(:all) do
    Product.destroy_all
    Review.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    @review = Review.create({author: "Jane Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscin", rating: 4, product_id: @product.id})
    user = User.create(:email => "user@test.com", :password => "password")
    visit signin_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
  end

  it "edits a review" do
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
end