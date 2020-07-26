class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name, type: String
  field :telephone, type: String
  field :fax, type: String
  field :website, type: String
  field :address_id, type: String
  field :created_at, type: String
  slug :name, history: true

  # has_one :address_id, as: :location, autosave: true
  has_and_belongs_to_many :address
  has_and_belongs_to_many :people
end
