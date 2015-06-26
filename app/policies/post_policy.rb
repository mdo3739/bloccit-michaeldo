class PostPolicy < ApplicationPolicy
	
	def destroy?
		user.present? && (record.user == user || user.admin? || user.moderator?)
	end

	class Scope
		attr_reader :user, :scope
=begin
		def initialize(user, scope)
			@user = user
			@scope = scope
		end

		def resolve
			if user.nil?
				scope.none
			elsif user.admin? || user.moderator?
				scope.all
			elsif user.present?
				scope.where(user: @user)
			end

=end		end
	end
end