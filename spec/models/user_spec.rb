require 'rails_helper'

RSpec.describe User, :type => :model do
 
 let (:user) {user: 'jean', password: '12345678', password_confirm: '12345678'}

 	describe'user' do
 		context'signing up'do
 		it 'for the first time' do
 			visit(/posts)
 			click_link()
 		end 
 	end
 end

end
