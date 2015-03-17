require 'faker'
 
 # Create Posts
50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
  )
 end
 posts = Post.all
 unless Post.where(title: "Original Post")
 	Post.create!(
 		title: "Original Post"
 		body:  "Original Body"
 	)
# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end
 
puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"