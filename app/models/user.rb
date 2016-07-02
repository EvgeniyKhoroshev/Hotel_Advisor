class User < ActiveRecord::Base

  before_save {self.email = email.downcase}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME_REGEX = /[a-zA-Zа-яА-ЯёЁ]/

  validates :name, :surname, :email, presence: true, length: {maximum: 40}
  validates :name, :surname, format: {with: VALID_NAME_REGEX}
  validates :email,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: {minimum: 6}
end
