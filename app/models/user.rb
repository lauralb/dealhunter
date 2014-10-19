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

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else

        user = Client.create(
            first_name: auth.info.first_name,
                last_name: auth.info.last_name,
                newsletter_frequency_id:1,
                user_id:User.create(
                    provider:auth.provider,
                    uid:auth.uid,
                    email:auth.info.email,
                    password:Devise.friendly_token[0,20],
                    user_role_id:2
                ).id
            ).user
      end

    end
  end


end
