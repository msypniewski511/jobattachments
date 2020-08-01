class Skill
  include Mongoid::Document
  include Mongoid::Timestamps

  field :urlStem, type: String
  field :name, type: String
  field :skillCode, type: String

  # metal-kitchen-worktops", "id": 47, "order": "960", "crawlableInLocal": false, "count": 11 },"
  field :count, Type: Integer
  field :crawlableInLocal, Type: Boolean, defult: false
end
