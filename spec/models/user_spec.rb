require 'rails_helper'

describe User do

	before do
		@user = create(:user_with_post_and_comment)
		@user2 = create(:user_with_post_and_comment)
	end

	describe "#favorited(post)" do

		before do
			@post = @user.posts.first
			@post.favorites.create(user: @user2)
		end

		it "returns 'nil' if the user has not favorited the post" do
			expect(@user.favorited(@post)).to eq(nil)
		end

		it "returns the appropraite favorite if it exists" do
			expect(@user2.favorited(@post)).to eq(@post.favorites.where(user: @user2).first)
		end

		it "returns 'nil' if the user has favorited another post" do
			expect(@user2.favorited(create(:post))).to eq(nil)
		end
	end

	describe ".top-rated" do

		before do
			#@user2.posts.first.comments << create(:comment, user: @user2)
			create(:comment, user: @user2)
		end

		it "returns users ordered by comments + posts" do
			expect( User.top_rated).to eq([@user2, @user])
		end

		it "stores a 'posts_count' on user" do
			users = User.top_rated
			expect(users.first.posts_count).to eq(1)
		end

		it "stores a 'comments_count' on user" do 
			users = User.top_rated
			expect(users.first.comments.count).to eq(2)
		end
	end
end