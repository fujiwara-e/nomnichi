# RAILS_ENV=production bundle exec rails console
# RAILS_ENV=production bundle exec rails runner runner/dump_to_files.rb
# bundle exec rails runner runner/dump_to_files.rb
# create_table "articles", force: :cascade do |t|
#     t.integer  "user_id"
#     t.string   "title"
#     t.string   "perma_link"
#     t.text     "content"
#     t.datetime "published_on"
#     t.boolean  "approved"
#     t.integer  "count",            default: 0
#     t.boolean  "promote_headline"
#     t.datetime "created_at",                   null: false
#     t.datetime "updated_at",                   null: false
#   end
#
Article.all.each do |article|
  File.open("dump/articles/#{article.perma_link}.md", 'w') do |f|
    f.puts "Title: #{article.title}"
    f.puts "Permalink: #{article.perma_link}"
    f.puts "Published: #{article.published_on}"
    f.puts "Approved: #{article.approved}"
    f.puts "Count: #{article.count}"
    f.puts "Promote: #{article.promote_headline}"
    f.puts "Created: #{article.created_at}"
    f.puts "Updated: #{article.updated_at}"
    f.puts "Author: #{article.user.ident}"
    f.puts ""
    f.puts "#{article.content}"
  end
end
