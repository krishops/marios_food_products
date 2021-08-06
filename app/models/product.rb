class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: :true 
  validates :cost, presence: :true
  validates :country_of_origin, presence: :true
  
  before_save(:titleize_product)
  # before_save(ADD DECIMALS TO COST)

  def self.usa
    where(country_of_origin: "USA")
  end

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(10)
  )}

  private
    def titleize_product
      if self.country_of_origin.titleize == "Usa"
        self.country_of_origin = self.country_of_origin.upcase
      else
        self.name = self.name.titleize
        self.country_of_origin = self.country_of_origin.titleize
      end
    end
end