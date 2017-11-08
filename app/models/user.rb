class User < ApplicationRecord
  has_many :handles
  has_many :connections

  validates :first_name, :last_name, :password, presence:  true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info[:uid]
      new_user.first_name         = auth_info[:info][:name].split.first
      new_user.last_name          = auth_info[:info][:name].split.last
      new_user.email              = auth_info[:info][:email]
      new_user.password           = auth_info[:credentials][:token]
      new_user.oauth_token        = auth_info[:credentials][:token]
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
