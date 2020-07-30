class Person < Employe
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  include Mongoid::Attributes::Dynamic
  include ActiveModel::Validations

  field :title
  field :first_name 
  field :last_name
  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # field :email, type: :String
  field :telephone
  field :mobile_phone
  field :job_title
  # field :date_of_birth
  attr_accessor :date_of_birth, :Date
  attr_accessor :gender, :Integer
  
  attr_accessor :keywords, :Text
  attr_accessor :notes, :Text

  # validates_associated :address
  validates_presence_of :title
  has_and_belongs_to_many :address, autosave: true, :dependent => :destroy
  has_and_belongs_to_many :companies, autosave: true, :dependent => :destroy

  accepts_nested_attributes_for :address, :companies, allow_destroy: true
  # validates_associated :addresses



  def full_name
    out = (title.blank? ? '' : title + ' ')
    out + first_name + ' ' + last_name
  end

  slug :telephone, history: true

  def self.find_all_ordered
    find :all, :order => 'last_name, first_name'
  end

  # before_save :downcase_email
  private

end
