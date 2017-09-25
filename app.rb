require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/player")
require("./lib/team")
require("./lib/coordinator")
require("pg")
require('pry')

get('/') do
  @coordinators = Coordinator.all()
  @teams = Team.all()
  @players = Player.all()
  erb(:index)
end

post('/') do
  coordinator = Coordinator.create({:name => params["name"]})
  @coordinators = Coordinator.all()
  @teams = Team.all()
  @players = Player.all()
  erb(:index)
end

get('/coordinator/:id') do
  @coordinator = Coordinator.find(params["id"])
  @teams = @coordinator.teams()
  erb(:coordinator)
end

post('/coordinator/:id') do
  @coordinator = Coordinator.find(params["id"])
  team = Team.create(:name => params["name"], :coordinator_id => params["id"])
  @teams = @coordinator.teams()
  erb(:coordinator)
end

get('/team/:id') do
  @team = Team.find(params["id"])
  @players = @team.players()
  erb(:team)
end

post('/team/:id') do
  @team = Team.find(params["id"])
  player = Player.create(:name => params["name"], :team_id => params["id"])
  @players = @team.players()
  erb(:team)
end

get('/player/:id') do
  @player = Player.find(params['id'])
  @team = @player.team()
  erb(:player)
end

patch('/player/:id') do
  @player = Player.find(params['id'])
  @player.update({:name => params['name']})
  @team = @player.team()
  erb(:player)
end
