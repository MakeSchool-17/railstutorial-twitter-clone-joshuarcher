class User < ActiveRecord::Base
  # validates(:name, presence: true)
  # before_save { self.email = email.downcase }
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}

  has_secure_password
  # this has ability to securely save hashed
  # =>                password_digest attribute
  # creates pair of virtual attributes
  # => password & password_confirmation
  # creates authenticate method that returns user
  # => when password is correct
  validates :password, presence: true, length: { minimum: 6 }
end
