require 'rails_helper'

describe "the delete a review process" do

  before(:all) do
    Product.destroy_all
    Review.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
    @review = Review.create({author: "Jane Doe", content_body: "Lorem ipsum dolor sit amet, consectetuer adipiscin", rating: 4, product_id: @product.id})
    admin = User.create(:email => "admin@test.com", :password => "password", admin: 'true')
    visit signin_path
    fill_in 'Email', :with => admin.email
    fill_in 'Password', :with => admin.password
    click_on 'Log in'
  end

  it "deletes review" do
    visit product_review_path(@product, @review)
    delete_window = window_opened_by do
      click_link 'Delete review'
    end
    within_window delete_window do
      click_button 'OK'
    end
    expect(page).to have_no_content 'Jane Doe'
    expect(page).to have_no_content 'Lorem ipsum dolor sit amet, consectetuer adipiscin'
    expect(page).to have_no_content '4'
  end
end