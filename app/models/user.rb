class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :client_attributes
  attr_accessor :new_password
   belongs_to :user_role
   has_one :company
   has_one :client

  attr_accessible :email, :password, :user_role_id, :company, :uid, :provider

  validates_presence_of :email, :password
  validates_confirmation_of :password, :on => :create

  accepts_nested_attributes_for :client, :allow_destroy => true

  def company?
    role_id = UserRole.where(:name => "CompanyUser").first().id
    self.user_role_id == role_id
  end

<<<<<<< HEAD
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]

        )
      end

=======
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.instance_variable_names
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
>>>>>>> 3cf8e7244af81e88ee2e918c787e8f9390b11781
    end
  end


end
