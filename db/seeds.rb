# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# admin user
unless User.exists?(email: "admin@a-blog.com")
User.create!(email: "admin@a-blog.com", password: "Password", admin: true)
end

# normal user
unless User.exists?(email: "viewer@a-blog.com")
  User.create!(email: "viewer@a-blog.com", password: "Password")
end
