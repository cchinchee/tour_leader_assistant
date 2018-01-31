require 'rails_helper'

RSpec.describe DateAvailable, type: :model do
	describe "belongs to user" do
	    it { should belong_to(:user) }
	end	
end
