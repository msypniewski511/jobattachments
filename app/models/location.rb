# frozen_string_literal: true

class Location
  include Mongoid::Document

  embedded_in :person
end
