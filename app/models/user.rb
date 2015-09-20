class User < ActiveRecord::Base
  before_create :create_remember_token

  validates :username, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }

  has_secure_password

  validates_presence_of :password, on: :create
  validates :password, length: { maximum: 30 },
                       format: { with: /\A(?=[a-zA-Z\d]*[a-z])(?=[a-zA-Z\d]*[A-Z])(?=[a-zA-Z\d]*\d)[a-zA-Z\d]{8,}\z/ }

  def to_param
    username
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
