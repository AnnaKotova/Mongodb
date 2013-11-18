class User
  include ActiveModel::SecurePassword
  include Mongoid::Document

  validates_presence_of :password, :on => :create
  attr_accessible :name,:email, :password, :password_confirmation


  field :remember_token, type: String
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

 # field :admin, type: Boolean, default: false
   
   has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   				uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
  
  validates :password_confirmation, presence: true
 
 private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
