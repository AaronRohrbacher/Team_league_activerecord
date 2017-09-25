class Game < ActiveRecord::Base
  has_many(:teams)

  # def initialize(attributes)
  #   @game_name = attributes(:game_name)
  # end

  def self.match_teams()
    # Team.order(:wins)
    sortedTeam =[]
    Team.order(:wins).each do |team|
      sortedTeam.push(team.name)
    end
    while sortedTeam.any? do
      team1 = sortedTeam.pop()
      team2 = sortedTeam.pop()
      game_name = ((team1)+" vs "+(team2))
      if !(sortedTeam.include?(game_name))
        Game.create(:name => game_name)
      end
    end
  end
end
