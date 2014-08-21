require 'rails_helper'

 
describe 'user' do

 		context'sign up' do
 		
	 		before(:each) do 
	 			user= User.create(email: 'jean@test.com',
	 												password: '12345678',
	 												password_confirmation: '12345678')
	 			login_as user
	 									end
		 
	 		it 'cannot post without signing' do
	 			visit('/posts')
	 			expect(page).to have_button('Create Post')
	 			expect(page).not_to have_content('Sign in')
	 			expect(page).not_to have_content('Sign up')
	 		end
	 	

	 		it 'can log out' do
	 			visit('/posts')
	 			click_link 'Sign out'
	 			expect(page).not_to have_button('Create Post')
	 		end 

 		end
 end