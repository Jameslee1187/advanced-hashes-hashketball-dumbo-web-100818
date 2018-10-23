require 'pry'
def game_hash
  return {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end


        

def num_points_scored(name)

def shoe_size(name)
  game_hash[:home][:players].each {|player, stats| return stats[:shoe] if player == name}
  game_hash[:away][:players].each {|player, stats| return stats[:shoe] if player == name}
end

def team_colors(team)
return game_hash[:home][:colors] if game_hash[:home][:team_name] == team
return game_hash[:away][:colors] if game_hash[:away][:team_name] == team
end

def team_names
  game_hash.collect do |key, value|
    value[:team_name]
end
end

def player_numbers(team_name)
  answer = []
  game_hash.each do |key, value|
    if value[:team_name] == team_name
    value[:players].each do |player, stats|
      stats.each do |k, v|
        if k == :number
          answer << v
        end
      end
    end
  end
end
  answer
end

def player_stats(name)
  game_hash.each do |team, info|
    info.each do |category, details|
      if category == :players
        details.each do |player, stats|
          return stats if player == name
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do |team, team_details_hash|
      team_details_hash[:players].each do |players, stats|
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end

def most_points_scored
  most_points = 0
  name = nil
  game_hash.each do |team, team_details_hash|
    team_details_hash[:players].each do |players, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        name = players
      end
    end
  end
  name
end

def winning_team
  away_total = 0
  home_total = 0
    game_hash[:away][:players].each do |name, stats|
      away_total += stats[:points]
    end
    game_hash[:home][:players].each do |name, stats|
      home_total += stats[:points]
    end
    if away_total > home_total
       game_hash[:away][:team_name]
    else away_total < home_total
       game_hash[:home][:team_name]
    
    end
end

def player_with_longest_name
    longest = 0
  player_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if name.length > longest
        player_name = name
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  steal = 0
  player_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if value[:steals] > steal
        player_name = name
      end
    end
  end
  if player_name == player_with_longest_name
    return true
  else
    return false
  end
end
    
  
              
      
    
        
      