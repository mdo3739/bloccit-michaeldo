class PostPolicy < ApplicationPolicy
	class Scope
		attr_reader :user, :scope

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

		end
	end
end