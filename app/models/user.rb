class User < ActiveRecord::Base
  attr_reader :password
  attr_accessible :username, :email, :password
  validates :username, 
            :email, 
            :password_digest, 
            :session_token, 
            :presence => :true
  validates :password, :length => { :minimum => 6 }, :on => :create
  validates :username, :email, :uniqueness => :true
  before_validation :generate_session_token

  has_many :recipes
  has_many :favorites
  has_many :favorite_recipes, :through => :favorites, :source => :recipe
  
  def self.find_by_credentials(params)
    user = User.find_by_username(params[:username])
    return nil unless user
    return user if user.is_password?(params[:password])
  end
  
  def generate_session_token 
    self.session_token = SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.generate_session_token
    self.save!
  end
  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
  
  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end
end
