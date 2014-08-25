require 'sinatra'

nfl_team = ["Patriots", "Broncos", "Colts", "Steelers"]

get '/leaderboard' do
  nfl_team
 end
