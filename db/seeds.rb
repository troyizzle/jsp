# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:

example_user = User.find_or_create_by!(email: "hello@hello.com", username: "NeedFg") do |user|
  user.password = "password"
end

jsp = Category.find_or_create_by!(title: "jsp")
jsp.forums.create!([
  {title: "Site Announcements"},
  {title: "Donor Forum"},
  {title: "General Help"}
])

diablo_2 = Category.find_or_create_by!(title: "Diablo 2")
diablo_2.forums.create!([
  {title: "Trading Grounds"},
  {title: "Diablo 2 Discussion"}
])

d2r_forum = diablo_2.forums.create!(title: "Diablo 2: Resurrected")
puts "Created forum: #{d2r_forum.inspect}"
d2r_hc_forum = Forum.create!([
  {
    title: "D2:R Hardcore Ladder Trading",
    category_id: d2r_forum.category_id,
    parent_id: d2r_forum.id
  }
]).first

puts "Created forum: #{d2r_hc_forum.inspect}"

d2r_hc_forum.topics.create!([
  {title: "ISO: 4os eth thresher", created_by: example_user},
  {title: "FT: 5os eth thresher", created_by: example_user}
])

topic = d2r_hc_forum.topics[0]

topic.posts.create!([
  {content: "I have a 4os eth thresher. What are you offering?", created_by: example_user, updated_by: example_user},
  {content: "I have a 5os eth thresher. I'm looking for a 4os eth thresher.", created_by: example_user, updated_by: example_user},
  {content: "Trade completed. Thanks!", created_by: example_user, updated_by: example_user}
])
