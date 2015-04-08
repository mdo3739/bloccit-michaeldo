class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :topic
	has_many :votes, dependent: :destroy
	default_scope {order('created_at DESC')}
	scope :ordered_by_title, -> {reorder(:title)}

	validates :title, length: {minimum: 5}, presence: true
	validates :body, length: {minimum: 20}, presence: true
#	validates :topic, presence: true
#	validates :user, presence: true

	def up_votes
		votes.where(value: 1).count
	end

	def down_votes
		votes.where(value: -1).count
	end

	def points
		up_votes - down_votes
	end
end
