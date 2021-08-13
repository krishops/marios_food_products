require 'rails_helper'

describe "the add a review process" do

  before(:all) do
    Product.destroy_all
    @product = Product.create({name:"Spaghetti", cost: 9.99, country_of_origin: "Italy"})
  end

  it "adds a new review" do
    visit product_path(@product)
    click_link 'Add a review'
    fill_in 'Author', :with => 'Jane Doe'
    fill_in 'Content body', :with => 'Lorem ipsum dolor sit amet, consectetuer adipiscin'
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'Review Added'
    expect(page).to have_content 'Jane Doe'
  end

  it "gives an error when no author, content, or rating is entered" do
    visit product_path(@product)
    click_link 'Add a review'
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Rating is not included in the list"
  end
end