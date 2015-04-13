#require 'paginate'

class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy

	validates :name, length: {minimum: 5}
#	extend Paginate

	scope :visible_to, lambda { |user| user ? all : where(public: true) }
end
