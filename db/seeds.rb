require "faker"

puts "Dropping Articles"

Article.delete_all

100.times do |index|
  puts "Creating Article #{index + 1}"
  article = Article.new
  article.title = Faker::Lorem.words(5).join(" ")
  article.text = Faker::Lorem.paragraphs(3).join(" ")
  article.save!
end

puts "Articles Created"
