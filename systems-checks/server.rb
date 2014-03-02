require 'sinatra'
require 'pry'

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

get '/:path' do
  games = [
  {home_team: "Patriots",away_team: "Broncos",home_score: 7,away_score: 3},
  {home_team: "Broncos",away_team: "Colts",home_score: 3,away_score: 0},
  {home_team: "Patriots",away_team: "Colts",home_score: 11,away_score: 7},
  {home_team: "Steelers",away_team: "Patriots",home_score: 7,away_score: 21}]

  team_scores = {}
  teams = []
  games.each do |game|
    teams << game[:home_team]
    teams << game[:away_team]
  end
  teams.uniq!.each do |team|
    team_scores[team] = {wins:0,losses:0}
  end
  games.each do |game| 
    if game[:home_score] > game[:away_score]
      team_scores[game[:home_team]][:wins] += 1
      team_scores[game[:away_team]][:losses] += 1
    else
      team_scores[game[:home_team]][:losses] += 1
      team_scores[game[:away_team]][:wins] += 1
    end
  end
  
  title = params[:path].capitalize
  html = "
  <style>
  body {background: #011226 url('http://static.nfl.com/static/content/public/static/img/head/feb-3-background.jpg') no-repeat top center;
  color:white;}
  a:link {color:#green;} 
  a:visited {color:pink;}}
  </style>"
  if teams.include?params[:path].capitalize
    html << "
    <title>#{title}</title>
    <br><h1>#{title}</h1>
    <table border='1' style='width:300px'>
    <tr>
      <th>Opposing Team</th>
      <th>Location</th>
      <th>#{title} Score</th> 
      <th>Opposing Score</th>
    </tr>"
    games.each do |game|
      if game[:home_team] == title
        html << "<tr>
          <td>#{game[:away_team]}</td>
          <td>Home</td> 
          <td>#{game[:home_score]}</td> 
          <td>#{game[:away_score]}</td> 
        </tr>"
      elsif game[:away_team] == title
        html << "<tr>
          <td>#{game[:home_team]}</td>
          <td>Away</td> 
          <td>#{game[:away_score]}</td> 
          <td>#{game[:home_score]}</td> 
        </tr>"
      end
    end
    html << "</table>"
  else
    rankings=team_scores.sort {|team1,team2| [team2[1][:wins],team1[1][:losses]]<=>[team1[1][:wins],team2[1][:losses]]}
    #that line took more time than the rest of the variables combined...at least I understand the sort method much better.
    html << "
    <title>Leaderboard</title>
    <br><h1>Leaderboard</h1>
    <table border='1' style='width:300px'>
    <tr>
      <th>Team</th>
      <th>Wins</th> 
      <th>Losses</th>
    </tr>"
    rankings.each do |team|
      html << "<tr>
        <td><a href='#{team[0]}'>#{team[0]}</a></td>
        <td>#{team[1][:wins]}</td> 
        <td>#{team[1][:losses]}</td> 
      </tr>"
    end
    html << "</table>"
  end
  html
end
