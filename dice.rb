require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to resart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)

end

get("/dice/2/10") do
  first_d10 = rand(1..10)
  second_d10 = rand(1..10)
  sum_d10 = first_d10 + second_d10

  @outcome_d10 = "You rolled a #{first_d10} and a #{second_d10} for a total of #{sum_d10}."

  erb(:two_ten)
end

get("/dice/1/20") do
  @d20 = rand(1..20)

  @outcome_d20 = "You rolled a #{@d20}."
  
  erb(:one_twenty)
end

get("/dice/5/4") do
  first_d4 = rand(1..4)
  second_d4 = rand(1..4)
  third_d4 = rand(1..4)
  fourth_d4 = rand(1..4)
  fifth_d4 = rand(1..4)

  sum_d4 = first_d4 + second_d4 + third_d4 + fourth_d4 + fifth_d4

  @outcome_d4 = "You rolled a #{first_d4}, a #{second_d4}, a #{third_d4}, a #{fourth_d4} and a #{fifth_d4} for a total of #{sum_d4}"

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
