class User < ActiveRecord::Base
  after_initialize :default_values

  has_secure_password
  attr_accessible :count, :password, :username
  before_save :create_remember_token
  validates :name, presence: true, length: { maximum: 128 }, uniqueness: true
  validates :password, presence: true, length: { maximum: 128 }, uniqueness: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def increment_count
    self.increment(:count)
  end

  def default_values
    self.count ||= 1
  end
end
