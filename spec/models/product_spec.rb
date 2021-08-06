require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :cost } 
  it { should validate_presence_of :country_of_origin }

  it("titleizes the name of a product") do
    product = Product.create({name:"lasagna", cost: 9.99, country_of_origin: "Italy"})
    expect(product.name()).to(eq("Lasagna"))
  end

  it("titleizes the name of a country") do
    product = Product.create({name:"Lasagna", cost: 9.99, country_of_origin: "italy"})
    expect(product.country_of_origin()).to(eq("Italy"))
  end

  it("uppercases the name of a usa") do
    product = Product.create({name:"PB & J", cost: 9.99, country_of_origin: "usa"})
    expect(product.country_of_origin()).to(eq("USA"))
  end
end

  