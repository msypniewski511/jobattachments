# frozen_string_literal: true

class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  field :name, type: String
  field :telephone, type: String
  field :fax, type: String
  field :website, type: String
  field :address_id, type: String
  # field :created_at, type: String
  slug :name, history: true
  validates_presence_of :name

  # has_one :address_id, as: :location, autosave: true
  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :people

  accepts_nested_attributes_for :addresses, :people, allow_destroy: true, reject_if: :all_blank
end
