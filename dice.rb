# /dice.rb
require "sinatra"
require "sinatra/reloader"

get("/") do
  "Hello, world!"
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully we don't need to restart the server!"
end

