img = "https://m.media-amazon.com/images/I/5187PQgDScL.jpg"


# # Seed data for the books table
# book1 = Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", description: "A classic novel about the excesses and moral decay of the wealthy in the 1920s.", cover_image: img)
# book2 = Book.create(title: "To Kill a Mockingbird", author: "Harper Lee", description: "A story about racial injustice and the loss of innocence in a small town.", cover_image: img)
# book3 = Book.create(title: "Brave New World", author: "Aldous Huxley", description: "A dystopian novel about a future society where people are genetically engineered and conditioned to be content with their lives.", cover_image: img)

# # Seed data for the genres table
# genre1 = Genre.create(name: "Fiction")
# genre2 = Genre.create(name: "Classics")
# genre3 = Genre.create(name: "Science Fiction")

# # Seed data for the book_genres table
# BookGenre.create(book_id: book1.id, genre_id: genre2.id)
# BookGenre.create(book_id: book2.id, genre_id: genre1.id)
# BookGenre.create(book_id: book3.id, genre_id: genre3.id)

# # Seed data for the users table
# user1 = User.create(username: "john_doe", email: "johndoe@example.com", password: "password")
# user2 = User.create(username: "jane_smith", email: "janesmith@example.com", password: "password")

# # Seed data for the reviews table
# Review.create(title: "Great book!", content: "I loved this book so much. The characters were complex and interesting, and the story was gripping from start to finish.", user_id: user1.id, book_id: book1.id)
# Review.create(title: "Amazing!", content: "This is one of the best books I've ever read. The writing is beautiful and poignant, and the themes are so relevant today.", user_id: user2.id, book_id: book2.id)


require 'faker'

# Seed data for the books table
10.times do
  Book.create(title: Faker::Book.unique.title, author: Faker::Book.author, description: Faker::Lorem.paragraph, cover_image: img )
end

# Seed data for the genres table
5.times do
  Genre.create(name: Faker::Book.unique.genre)
end

# Seed data for the book_genres table
Book.all.each do |book|
  rand(1..3).times do
    BookGenre.create(book_id: book.id, genre_id: rand(1..Genre.count))
  end
end

# Seed data for the users table
10.times do
  User.create(username: Faker::Internet.unique.username, email: Faker::Internet.unique.email, password: "password")
end

# Seed data for the reviews table
User.all.each do |user|
  rand(1..5).times do
    Review.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraphs(number: 3).join("<br>"), user_id: user.id, book_id: rand(1..Book.count))
  end
end
