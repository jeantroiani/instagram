require 'rails_helper'

describe 'Tags' do
	
	it 'has tags with post' do
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
		click_link('#Brighton')
		expect(page).to_not have_content('#arepas')
		expect(page).to_not have_content('#food').exactly(2).times
	end

end