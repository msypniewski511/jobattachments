# frozen_string_literal: true

class JobSearchResult
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  field :id
  field :description
  field :created
  field :title
  field :salary_min
  field :longitude
  field :latitude
  field :location, type: Hash

  field :salary_is_predicted, type: Mongoid::Boolean

  field :contract_time
  field :redirect_url
  field :category, type: Hash
  field :contract_type
  field :company, type: Hash
  field :salary_max
end
