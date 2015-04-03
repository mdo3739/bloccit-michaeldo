require 'paginate'

class Topic < ActiveRecord::Base
	has_many :posts
	extend Paginate

end
