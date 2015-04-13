require 'rails_helper'

describe User do
	include TestFactories

	before do
		@user = authenticated_user
		@post = associated_post
		@user2 = authenticated_user
		@post.favorites.create(user: @user2)
	end

	describe "#favorited(post)" do
		it "returns 'nil' if the user has not favorited the post" do
			expect(@user.favorited(@post)).to eq(nil)
		end

		it "returns the appropraite favorite if it exists" do
			expect(@user2.favorited(@post)).to eq(@post.favorites.where(user: @user2).first)
		end

		it "returns 'nil' if the user has favorited another post" do
			expect(@user2.favorited(associated_post)).to eq(nil)
		end
	end
end