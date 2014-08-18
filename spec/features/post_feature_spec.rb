require 'rails_helper'

describe 'post' do
	
	context 'no post showing' do
		it ' informs that no post has been created' do
		visit('/posts')
		expect(page).not_to have_content('No post added yet')
		end
	end

	context 'Shows post once one post is created' do
		it 'shows the post created' do
		Post.create(title:'Brighton')
		visit('/posts')
		expect(page).to have_content('Brighton')
		end
	end
end

