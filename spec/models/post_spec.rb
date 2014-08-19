require 'rails_helper'

RSpec.describe Post, :type => :model do

	context 'tags' do
		describe'wit not tags' do
			let (:post) {Post.create(title: 'Brighton')}

			it 'has no tags' do
				post.tags_list= ''
				expect(post.tags).to be_empty
			end
		end

		describe'with tags' do
			let (:post) {Post.create(title: 'Brighton')}

			it 'has one tag' do
				post.tags_list=('#party')
				expect(post.tags.first.text).to eq('#party')
			end
	

			let (:post) {Post.create(title: 'Brighton')}

			it 'has multiple tag' do
				post.tags_list=('#party #wild')
				expect(post.tags.first.text).to eq('#party')
				expect(post.tags.last.text).to eq('#wild')
			end
		end	


	end
end
