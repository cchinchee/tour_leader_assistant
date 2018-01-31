require 'rails_helper'

RSpec.describe Tour, type: :model do
	describe "validation of presence of start date" do
		it { should validate_presence_of(:start_date) }
	end

	describe "validation of presence of end date" do
		it { should validate_presence_of(:end_date) }
	end

	describe "validation of presence of customer name " do
		it { should validate_presence_of(:customer_name ) }
	end

	describe "validation of presence of address" do
		it { should validate_presence_of(:address) }
	end

	describe "validation of presence of state" do
		it { should validate_presence_of(:state) }
	end

	describe "validation of presence of city" do
		it { should validate_presence_of(:city) }
	end

	describe "validation of presence of postcode" do
		it { should validate_presence_of(:postcode) }
	end

	describe "belongs to user" do
	    it { should belong_to(:user) }
	end	

	describe "has many association with users_tours" do
		it {should have_many(:users_tours).dependent(:destroy)}
	end
	describe "full_street_address" do
		it "should combine components in one line" do
			@user = User.create(first_name:"somebody", last_name:"body", email:"somebody@mail.com", password: "password", phone:"123456778")
			@tour = Tour.create(user_id: @user.id, start_date: "29 jan 2018", end_date: "31 jan 2018", itinerary:"3 days tour", customer_name:"miki", customer_email:"miki@gmail.com", customer_phone:"123456767", address:"8 next academy", state:"penang", city:"george town", postcode:"12356" )
			expect(@tour.full_street_address).to eq "8 next academy,12356,george town,penang"
		end
	end	

	describe "num_of_days test" do
		it "should calculate the number of days for the tour" do
			@user = User.create(first_name:"somebody", last_name:"body", email:"somebody@mail.com", password: "password", phone:"123456778")
			@tour = Tour.create(user_id: @user.id, start_date: "29 jan 2018", end_date: "31 jan 2018", itinerary:"3 days tour", customer_name:"miki", customer_email:"miki@gmail.com", customer_phone:"123456767", address:"8 next academy", state:"penang", city:"george town", postcode:"12356" )
			expect(@tour.num_of_days(@tour.start_date, @tour.end_date)).to eq 3
		end
	end	
end
