require 'rails_helper'

RSpec.describe User, :type => :model do
 
 let (:user) {User.create(user: 'jean', password: '12345678', password_confirmation: '12345678')}

 	describe'user' do
 	# 	context'sign up' do
 	# 	it 'cannot post without signing up' do
 	# 		visit('/posts')
 	# 		click_link(Sign up)
 	# 		fill_in 'email', 									with: 'test@mail.com' 
 	# 		fill_in 'password', 							with: '12345678'
 	# 		fill_in 'password confirmation', 	with: '12345678'
 	# 		click_button 'Sing up'
 	# 	end 
 	# end
 end
end
