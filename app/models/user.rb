class User < ActiveRecord::Base

  has_many :hotel, dependent: :destroy

  before_save {self.email = email.downcase}
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /[a-zA-Zа-яА-ЯёЁ]/

  validates :password, :password_confirmation, presence: true
  validates :name, :surname, :email, presence: true, length: {maximum: 40}
  validates :name, :surname, format: {with: VALID_NAME_REGEX}
  validates :email,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: {minimum: 6}

  mount_uploader :photo, UserPhotoUploader

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
