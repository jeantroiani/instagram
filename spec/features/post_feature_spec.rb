require 'rails_helper'

describe 'post' do
	
	context 'no post showing' do
		it 'informs that no post has been created' do
		visit('/posts')
		expect(page).to have_content('No post added yet')
		end
	end

	context 'Shows post once one post is created' do
		it 'shows the post created' do
		Post.create(title:'Brighton')
		visit('/posts')
		expect(page).to have_content('Brighton')
		end
	end

	context 'Creating a post' do
		it 'shows a form to filled by the user' do
			visit('/posts')
			click_button('Create Post')
			fill_in 'Title', with: 'Hello Brighton'
			click_button('Post')
			expect(page).to have_content('Hello Brighton')
		end
	end

	context 'Create a post with a picture' do
		it 'shows a form that allows the user to post with files' do
			visit('/posts')
			click_button('Create Post')
			fill_in 'Title', with: 'Hello Brighton'
			attach_file('Image',Rails.root + 'spec/images/brighton01.jpg')
			click_button('Post')
			expect(page).to have_content('Hello Brighton')
			expect(page).to have_css('img.uploaded-pic')
		end
	end
end

