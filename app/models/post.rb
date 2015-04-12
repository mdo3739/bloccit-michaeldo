#require 'paginate'

class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	belongs_to :topic
	has_one :summary
	has_many :votes, dependent: :destroy
	default_scope {order('rank DESC')}
	scope :ordered_by_title, -> {reorder(:title)}
#	extend Paginate
	mount_uploader :pic, PostPicUploader

	validates :title, length: {minimum: 5}, presence: true
	validates :body, length: {minimum: 20}, presence: true
	validates :topic, presence: true
	validates :user, presence: true

	def up_votes
		votes.where(value: 1).count
	end

	def down_votes
		votes.where(value: -1).count
	end

	def points
		up_votes - down_votes
	end

	def update_rank
		age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
		new_rank = points + age_in_days

		update_attribute(:rank, new_rank)
	end

	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, {})
	
	def markdown_title
		render_as_markdown(self.title)
	end

	def markdown_body
		render_as_markdown(self.body)
	end

	def create_vote
		user.votes.create(value: 1, post: self)
	end

	def save_with_initial_vote
		ActiveRecord::Base.transaction do
			self.save
			self.create_vote
		end
	end

	private

	def render_as_markdown(text)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, {})
		(markdown.render text).html_safe
	end
end
