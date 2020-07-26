class Location
  include Mongoid::Document
  
  embedded_in :person
end