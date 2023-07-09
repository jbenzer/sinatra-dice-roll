require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  #"Hello World"
  "
  <h1>Dice Roll</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-side dice</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "

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

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_d10 = rand(1..10)
  second_d10 = rand(1..10)
  sum_d10 = first_d10 + second_d10

  outcome_d10 = "You rolled a #{first_d10} and a #{second_d10} for a total of #{sum_d10}."

  "<h1>2d10</h1>
  <p>#{outcome_d10}</p>"
end

get("/dice/1/20") do
  d20 = rand(1..20)

  outcome_d20 = "You rolled a #{d20}."
  
  "<h1>d20</h1>
  <p>#{outcome_d20}</p>"
end

get("/dice/5/4") do
  first_d4 = rand(1..4)
  second_d4 = rand(1..4)
  third_d4 = rand(1..4)
  fourth_d4 = rand(1..4)
  fifth_d4 = rand(1..4)

  sum_d4 = first_d4 + second_d4 + third_d4 + fourth_d4 + fifth_d4

  outcome_d4 = "You rolled a #{first_d4}, a #{second_d4}, a #{third_d4}, a #{fourth_d4} and a #{fifth_d4} for a total of #{sum_d4}"

  "<h1>5d4</h1>
  <p>#{outcome_d4}</p>"
end
