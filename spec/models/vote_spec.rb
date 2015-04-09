require 'rails_helper'

describe Vote do 
	include TestFactories
	
	describe "validations" do
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				vote = Vote.new(value: 2)
				vote2 = Vote.new(value: -1)
				expect(vote.valid?).to eq(false)				
				expect(vote2.valid?).to eq(true)
			end
		end
	end

	describe 'after-save' do
		it "calls 'Post#update_rank' after save" do
			post = associated_post
			vote = Vote.new(value: 1, post: post)
			expect(post).to receive(:update_rank)
			vote.save
		end
	end
end