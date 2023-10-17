# /dice.rb
require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do

  zebra_url = "https://musical-umbrella-g4qjxqv69rrr29q99-4567.app.github.dev/zebra"
  zebra_text = "Ya like Zebras?"
  zebra_link = "<a href='#{zebra_url}'>#{zebra_text}</a>"
  
  giraffe_url = "https://musical-umbrella-g4qjxqv69rrr29q99-4567.app.github.dev/giraffe"
  giraffe_text = "Ya like Giraffes?"
  giraffe_link = "<a href='#{giraffe_url}'>#{giraffe_text}</a>"

  d26_url = "https://musical-umbrella-g4qjxqv69rrr29q99-4567.app.github.dev/dice/2/6"
  d26_text = "2D6?"
  d26_link = "<a href='#{d26_url}'>#{d26_text}</a>"
  
  d210_url = "https://musical-umbrella-g4qjxqv69rrr29q99-4567.app.github.dev/dice/2/10"
  d210_text = "2D10?"
  d210_link = "<a href='#{d210_url}'>#{d210_text}</a>"

  d120_url = "https://musical-umbrella-g4qjxqv69rrr29q99-4567.app.github.dev/dice/1/20"
  d120_text = "1D20?"
  d120_link = "<a href='#{d120_url}'>#{d120_text}</a>"

  d54_url = "https://musical-umbrella-g4qjxqv69rrr29q99-4567.app.github.dev/dice/5/4"
  d54_text = "5D4?"
  d54_link = "<a href='#{d54_url}'>#{d54_text}</a>"

  "<h1>Hello, world!</h1>
  <p>#{zebra_link}</p> 
  <p>#{giraffe_link}</p> 
  <p>#{d26_link}</p> 
  <p>#{d210_link}</p> 
  <p>#{d120_link}</p> 
  <p>#{d54_link}</p>"

end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully we don't need to restart the server!"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "you rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get("/dice/1/20") do
  first_die = rand(1..20)
  outcome = "You rolled a #{first_die} for a total of #{first_die}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die
  outcome = "You rolled a #{first_die}, #{second_die}, #{third_die}, and #{fourth_die} for a total of #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>"
end
