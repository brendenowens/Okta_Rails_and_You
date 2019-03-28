class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:oktaoauth]
  has_many :authorizations
  validates :name, :email, :presence => true

  def self.from_omniauth(auth)
    print("##################################################################################################################################")


    print("##################################################################################################################################")
    print("siugiosioug")
    user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
    end

  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.okta_data"] && session["devise.okta_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def oauth_permissions(state)
    state.to_s.split('scp=')[1].split("[")[1].split("]")[0].split(",").collect{|x| x.strip || x }
  end

end
