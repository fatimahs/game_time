require 'sinatra'
require 'pry'

games_data=[
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
]





def create_team_records(games)

  
  teams = {}

  games.each do |game|
    unless teams[game[:home_team]]
      teams[game[:home_team]] = {wins:0, losses:0}
    end
  end

  games.each do |game|
    unless teams[game[:away_team]]
      teams[game[:away_team]] = {wins:0, losses:0}
    end
  end


  games.each do |game|
    if game[:home_score] > game[:away_score]
      teams[game[:home_team]][:wins] += 1
      teams[game[:away_team]][:losses] += 1
    else
      teams[game[:home_team]][:losses] += 1
      teams[game[:away_team]][:wins] += 1
    end
  end

  teams
end




get '/leaderboard' do
  @team_records = create_team_records(games_data)

  erb :leaderboard
end
