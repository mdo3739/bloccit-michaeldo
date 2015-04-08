module Paginate
	def paginate(hash)
		hash[:page] ||= 1
		self.limit(hash[:per_page]).offset((hash[:page] - 1) * hash[:per_page])
	end
end