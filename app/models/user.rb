class User < ActiveRecord::Base
  attr_reader :password
  attr_accessible :username, :email, :password
  validates :username, 
            :email, 
            :password_digest, 
            :session_token, 
            :presence => :true
  validates :password, :length => { :minimum => 6 }
  validates :username, :email, :uniqueness => :true
  before_validation :reset_session_token!

  def self.find_by_credentials(params)
    user = User.find_by_username(params[:username])
    return nil unless user
    return user if user.is_password?(params[:password])
  end
  
  def self.generate_session_token 
    SecureRandom.urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
  end
  
  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end
  
  def is_password?(pw)
    BCrypt::Password.create(self.password_digest).is_password?(pw)
  end
end
