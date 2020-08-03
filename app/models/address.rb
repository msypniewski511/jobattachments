class Address
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :city, type: String
  field :street, type: String
  field :street1, type: String
  field :street2, type: String
  field :country, type: String
  field :post_code, type: String

  slug :city, history: true
  validates_presence_of :street
  # POSTCODE_REGEX = /^[A-Z][A-Z]?[0-9][A-Z0-9]? ?[0-9][ABDEFGHJLNPQRSTUWXYZ]{2}$/i
  # validates_format_of :post_code, :with => POSTCODE_REGEX, 
  # :message => "Please enter a valid post code"

  # has_many :pr_addresses
  # has_many :people, through: :pr_addresses
  has_and_belongs_to_many :people
  has_and_belongs_to_many :companies

  def validate_on_create
    if Address.find_by_street_1_and_post_code(street_0, post_code)
      errors.add_to_base('Street address and post code already exist in the database')
    end
  end
end
