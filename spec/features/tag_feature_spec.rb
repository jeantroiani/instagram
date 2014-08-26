require 'rails_helper'

describe 'Tags' do

	let(:user) do User.create(
			email:'test@test.com',
			password: '12345678',
			password_confirmation: '12345678'
		)end


	before(:each)do 
 user= User.create(email: 'digitalguest@gmail.com', password: '12345678', password_confirmation: '12345678')
 login_as user
end

	
	it 'has tags with post' do
		login_as user
		visit('/posts')
		click_button('Create Post')
		fill_in 'Title',	with: 'Brighton'
		fill_in 'Tags',		with: '#weekend #party'
		click_button('Post')
		expect(page).to have_content('Brighton')
		expect(page).to have_content('#weekend')
		expect(page).to have_content('#party')
	end

	it 'redirects to show all the post with the same tag selected' do
		post_1= Post.create(title:'Brighton', tags_list:'#food'  )
		post_2=	Post.create(title:'London', 	tags_list:'#food'	)
		post_3=	Post.create(title:'Caracas', 	tags_list:'#arepas')
		visit('/posts')
		click_link('#food', match: :first)
		expect(page).to_not have_content('#arepas')
		expect(page).to have_content('#food', count: 2)

	end

end