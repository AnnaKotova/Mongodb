class User
  include Mongoid::Document
  field :remember_token, type: String
  field :name, type: String
  field :email, type: String
 # field :admin, type: Boolean, default: false

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 },
	uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   				uniqueness: { case_sensitive: false }

 private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
