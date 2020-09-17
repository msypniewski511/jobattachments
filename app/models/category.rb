# frozen_string_literal: true

class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  # field :books
  # key :name, String
  # has_and_belongs_to_many :books
end
