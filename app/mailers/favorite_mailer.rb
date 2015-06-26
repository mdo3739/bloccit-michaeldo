class FavoriteMailer < ApplicationMailer
	default from: "mdo3739@gmail.com"

	def new_comment(user, post, comment)

		# New Headers
		headers["Message-ID"] = "<comments/#{comment.id}@bloccit-mdo3739.example>"
		headers["In-Reply-To"] = "<post/#{post.id}@bloccit-mdo3739.example>"
		headers["References"] = "<post/#{post.id}@bloccit-mdo3739.example>"

		@user = user
		@post = post
		@comment = comment

		mail(to: user.email, subject: "New comment on #{post.title}")
	end
end
