class User < ApplicationRecord
  attr_accessor :login
  has_one :vendor, dependent: :destroy
  has_many :user_provider, :dependent => :destroy
  has_one_attached :image
  has_many :favorites
  has_many :favorite_vendors, through: :favorites, source: :favorited, source_type: 'Vendor'
  has_many :favorite_products, through: :favorites, source: :favorited, source_type: 'Product'
  
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable ,:omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2]

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(name) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    puts auth
    puts "--------------------"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
    end
  end

  def self.from_omniauth_google(auth)
    puts auth
    puts "--------------------"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
    end
  end
end
