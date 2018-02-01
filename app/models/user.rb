class User < ApplicationRecord
	include BCrypt
	include ApplicationHelper
	has_secure_password
	enum role: { user: 0, superadmin: 1}
	mount_uploader :users_avatar, UsersAvatarUploader
	has_many :authentications, dependent: :destroy
  has_many :tours
  has_many :users_tours
  has_many :date_availables
  validates :email, presence:true, uniqueness: true
  validates :first_name, :last_name, presence:true
  validates :password, presence:true, on: :create

	def self.create_with_auth_and_hash(authentication, auth_hash)
      if auth_hash.provider == 'google_oauth2'
        user = self.create!(
          first_name: auth_hash["info"]["first_name"],
          last_name: auth_hash["info"]["last_name"],
          email: auth_hash["info"]["email"],
          remote_users_avatar_url: auth_hash['extra']['raw_info']['picture'],
          password: SecureRandom.hex(16)
        )
        user.authentications << authentication
        return user
      else auth_hash.provider == 'facebook'
        user = self.create!(
          first_name: auth_hash["info"]["first_name"],
          last_name: auth_hash["info"]["last_name"],
          email: auth_hash["extra"]["raw_info"]["email"],
          remote_users_avatar_url: auth_hash["info"]["image"],
          password: SecureRandom.hex(16)
        )
        user.authentications << authentication
        return user
      end  
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

    def google_token
      x = self.authentications.find_by(provider: 'google')
      return x.token unless x.nil?
    end
end
