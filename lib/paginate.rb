module Paginate
	def Topic.paginate(hash)
		@total_pages = (self.count / hash[:per_page]).ceil
		x = 1
		page_index = {}
		while x <= @total_pages do
			page_index[x] << self.limit(x * hash[:per_page]).offset((x - 1) * hash[:per_page])
			x += 1
		end
		page_index[hash[:page]]
	end

	def will_paginate(array)

	end
end