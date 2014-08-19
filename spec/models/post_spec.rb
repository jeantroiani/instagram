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
			let (:post) 	{Post.create(title: 'Brighton')}
			let (:post_2) {Post.create(title: 'Brighton')}

			it 'has one tag' do
				post.tags_list=('#party')
				expect(post.tags.first.text).to eq('#party')
			end

			it 'has multiple tag' do
				post.tags_list=('#party #wild')
				expect(post.tags.first.text).to eq('#party')
				expect(post.tags.last.text).to eq('#wild')
			end
			
			it 'will not accept tags duplicates in the same post' do
				post.tags_list=('#wild #wild #party')
				expect(post.tags.all.count).to eq(2)
			end


			it 'will not accept tags duplicates in different posts' do				
				post.tags_list=		('#wild')
				post_2.tags_list=	('#wild')
				expect(Tag.all.count).to eq(1)
			end
		end	
	end
end
