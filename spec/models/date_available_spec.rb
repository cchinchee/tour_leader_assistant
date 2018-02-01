require 'rails_helper'

RSpec.describe DateAvailable, type: :model do
	describe "belongs to user" do
	    it { should belong_to(:user) }
	end	

	describe "check overlapping dates test" do
		it "should have overlapping date" do
			@user = User.create(first_name:"somebody", last_name:"body", email:"somebody@mail.com", password: "password", phone:"123456778")
			@date1 = DateAvailable.create(start_date: "15 jan 2018", end_date: "17 jan 2018", user_id: @user.id)
			@date2 = DateAvailable.create(start_date: "16 jan 2018", end_date: "28 jan 2018", user_id: @user.id)
			expect(@date2.errors.empty?).to eq false
		end

		it "should not have overlapping date" do
			@user = User.create(first_name:"somebody", last_name:"body", email:"somebody@mail.com", password: "password", phone:"123456778")
			@date1 = DateAvailable.create(start_date: "15 jan 2018", end_date: "17 jan 2018", user_id: @user.id)
			@date2 = DateAvailable.create(start_date: "18 jan 2018", end_date: "20 jan 2018", user_id: @user.id)
			expect(@date2.errors.empty?).to eq true
		end
	end	
end
