class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email,password)
    email.downcase!
    email.strip!
    @user = User.find_by_email(email)
    return false if @user == nil
    @user.authenticate(password)
  end

end
