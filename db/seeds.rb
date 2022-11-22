# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts 'Cleaning up database'
Movie.destroy_all
puts 'Cleaned Database'

url = 'http://tmdb.lewagon.com/movie/top_rated'

# 10.times do |i|

puts 'Importing movies'
movies = JSON.parse(URI.open(url).read)['results']

movies.each do |movie|
  puts "Creating movie #{movie['title']}"
  base_movie_url = 'https://image.tmdb.org/t/p/w624'
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{base_movie_url}#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

puts 'Created movies'

# end
