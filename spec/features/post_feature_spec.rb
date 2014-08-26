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
	let (:user) do User.create(
		email: 'test@test.com',
		password: '12345678',
		password_confirmation: '12345678')
	end
		it 'shows a form to filled by the user' do
			login_as user
			visit('/posts')
			click_button('Create Post')
			fill_in 'Title', with: 'Hello Brighton'
			click_button('Post')
			expect(page).to have_content('Hello Brighton')
		end
	end

	context 'Create a post with a picture' do
			let (:user) do User.create(
		email: 'test@test.com',
		password: '12345678',
		password_confirmation: '12345678')
		end

		it 'shows a form that allows the user to post with files' do
			login_as user
			visit('/posts')
			click_button('Create Post')
			fill_in 'Title', with: 'Hello Brighton'
			attach_file('Image',Rails.root + 'spec/images/brighton01.jpg')
			click_button('Post')
			expect(page).to have_content('Hello Brighton')
			expect(page).to have_css('img.uploaded-pic')
		end
	end

	context 'can have' do
		let (:user) do 
			User.create(
				email: 'test@test.com',
				password: '12345678',
				password_confirmation: '12345678')
		end

		it 'a price next to it' do
			login_as user
			visit('/posts')
			click_button('Create Post')
			fill_in 'Title', with: 'Hello Brighton'
			fill_in 'Price', with: '500'
			attach_file('Image',Rails.root + 'spec/images/brighton01.jpg')
			click_button('Post')
			expect(page).to have_content('500')
		end

		it 'has a button to buy it',js: true do
			login_as user
			visit('/posts')
			click_button('Create Post')
			fill_in 'Title', with: 'Hello Brighton'
			fill_in 'Tags', with: '#food'
			fill_in 'Price', with: '500'
			attach_file('Image',Rails.root + 'spec/images/brighton01.jpg')
			click_button('Post')
			page.find('button.stripe-button-el').click
			Capybara.within_frame 'stripe_checkout_app' do
   		fill_in 'Email', :with => 'persona@example.com'
    	fill_in "Card number", :with => "4242424242424242"
    	fill_in 'CVC', :with => '123'
    	fill_in 'MM / YY', :with => '11/14'
    	click_button 'Pay $5.00'
  end
		end
	end

end

