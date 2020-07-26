class Person < Employe
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  
  field :title
  field :first_name
  field :last_name
  # field :email, type: :String
  field :telephone
  field :mobile_phone
  field :job_title
  # field :date_of_birth
  attr_accessor :date_of_birth, :Date
  attr_accessor :gender, :Integer
  attr_accessor :keywords, :Array
  attr_accessor :notes, :Text
  # field :address_id, type: :String
  # field :company_id, type: :String


  # belongs_to :address, autosave: true, foreign_key: :address_id
  # belongs_to :address

  # embeds_many :address, as: :locationable
  validates_associated :address
  
  has_and_belongs_to_many :address, autosave: true, :dependent => :destroy
  has_and_belongs_to_many :companies, autosave: true, :dependent => :destroy

  accepts_nested_attributes_for :address, :companies, allow_destroy: true
  # validates_associated :addresses
  # belongs_to :company
  # accepts_nested_attributes_for :address
  # accepts_nested_attributes_for :company


  def full_name
    out = (title.blank? ? '' : title + ' ')
    out + first_name + ' ' + last_name
  end

  slug :telephone, history: true

  def self.find_all_ordered
    find :all, :order => 'last_name, first_name'
  end
end
