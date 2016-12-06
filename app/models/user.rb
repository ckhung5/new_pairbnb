class User < ActiveRecord::Base
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  enum status: { tenant: 0, host: 1 , admin: 2}
  mount_uploader :image, ImageUploader
  has_many :reservations, :dependent => :destroy
  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
    u.name = auth_hash["extra"]["raw_info"]["name"]
    u.email = auth_hash["extra"]["raw_info"]["email"]
    u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end
 