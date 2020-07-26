class Address
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :city, type: String
  field :street, type: String
  field :street1, type: String
  field :street2, type: String
  field :post_code, type: String

  slug :city, history: true

  # has_many :pr_addresses
  # has_many :people, through: :pr_addresses
  has_and_belongs_to_many :address
  has_and_belongs_to_many :companies
end
