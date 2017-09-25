ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("player")
require("team")
require("coordinator")

RSpec.configure do |config|
  config.after(:each) do
    Player.all().each() do |player|
      player.destroy()
    end
  end

  config.after(:each) do
    Team.all().each() do |team|
      team.destroy()
    end
  end

  config.after(:each) do
    Coordinator.all().each() do |coordinator|
      coordinator.destroy()
    end
  end
end
