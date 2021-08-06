class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: :true 
  validates :content_body, presence: :true
  validates :content_body, length: { in: 50..250 }
  validates :rating, presence: :true
  validates_inclusion_of :rating, in: 1..5 

  before_save(:titleize_review)

  private
    def titleize_review
      self.author = self.author.titleize
    end
end