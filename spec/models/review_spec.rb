require 'rails_helper'

describe Review do
  it { should belong_to(:product) }

  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_inclusion_of :rating, in: 1..5 }
  it { should validate_length_of(:content_body).is_at_least(50).is_at_most(250) }
  

  it("titleizes the name of an author") do
    review = Review.create({author:"jane doe", content_body: "draft", rating: 4})
    expect(review.author()).to(eq("Jane Doe"))
  end
end