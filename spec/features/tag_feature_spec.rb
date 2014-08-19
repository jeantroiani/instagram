require 'rails_helper'

describe 'Tags' do
	
	it 'has tags with post' do
		visit('/posts')
		click_button('Create Post')
		fill_in 'Title',	with: 'Brighton'
		fill_in 'Tags',		with: '#weekend,#party'
		click_button('Post')
		expect(page).to have_content('Brighton')
		expect(page).to have_content('#weekend,#party')
	end
end