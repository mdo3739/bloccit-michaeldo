module ApplicationHelper
	def my_name
		p "Michael Do"
	end

	def form_group_tag(errors, &block)
		if errors.any?
			content_tag :div, capture(&block), class: 'form-group has-error'
		else
			content_tag :div, capture(&block), class: 'form-group'
		end
	end

	def markdown_to_html(markdown)
		renderer = Redcarpet::Render::HTML.new
		extensions = {fenced_code_blocks: true}
		redcarpet = Redcarpet::Markdown.new(renderer, extensions)
		(redcarpet.render markdown).html_safe
	end

	def up_vote_link_class(post)
		"glyphicon glyphicon-chevron-up #{(current_user.voted(post) && current_user.voted(post).up_vote?) ? 'voted' : ''}"
	end

	def down_vote_link_class(post)
		"glyphicon glyphicon-chevron-down #{(current_user.voted(post) && current_user.voted(post).down_vote?) ? 'voted' : ''}"
	end
=begin
	def will_paginate(collection)
		if collection.model == Topic
			whole_collection = Topic.all
		elsif collection.model == Post
			whole_collection = Topic.find(params[:id]).posts
		end
		total_pages = (whole_collection.count.to_f / collection.count).ceil
		page_links = "Page "
		num = 1

		if collection.include?(whole_collection.last)
			params[:page].to_i.times do
				page_links << "<a href=\"#{params[:id]}?page=#{num}\"> #{num} </a>"
				num += 1
			end
		else
			total_pages.times  do
				page_links << "<a href=\"#{params[:id]}?page=#{num}\"> #{num} </a>"
				num += 1
			end
		end
		page_links.html_safe
	end
=end
end
