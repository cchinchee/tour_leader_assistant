require 'rails_helper'

RSpec.describe User, type: :model do
	describe "validation"do
		describe "validation of presence of first name" do
			it { should validate_presence_of(:first_name) }
		end

		describe "validation of presence of last name" do
			it { should validate_presence_of(:last_name) }
		end

		describe "validation of presence of password" do
			it { should validate_presence_of(:password) }
		end

		describe "validation of presence of email" do
			it { should validate_presence_of(:email) }
		end

		describe "validation of uniqueness of email" do
			it { should validate_uniqueness_of(:email) }
		end

		describe "define enum for role" do
    		it { should define_enum_for(:role) }
    	end	

    	describe "has many association with authentications" do
    		it { should have_many(:authentications).dependent(:destroy)}
    	end

    	describe "has many association with users_tours" do
    		it { should have_many(:users_tours)}
    	end

    	describe "has many association with date_availables" do
    		it { should have_many(:date_availables)}
    	end

    	describe "has secure password" do
    		it { should have_secure_password }
      	end


	end 
end



