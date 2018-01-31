require 'rails_helper'

RSpec.feature "SignIns", type: :feature do
	describe "User sign in process", :type => :feature do
		
		before :each do
			@user = User.create(first_name: "darren", last_name:"chong", email:"chong@gmail.com", password:"secret")
		end 
		
		it "login" do
			visit '/'
			within("#login-form") do
				fill_in 'session_email', :with => 'chong@gmail.com'
				fill_in 'session_password', :with =>'secret' 
			end
			click_button 'Log In'
			expect(page).to have_content 'darren'
		end	
					
	end	
end


