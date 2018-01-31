require 'rails_helper'

RSpec.describe UsersTour, type: :model do
	describe "belongs to user" do
	    it { should belong_to(:user) }
	end	

	describe "belongs to tour" do
	    it { should belong_to(:tour) }
	end	
end
