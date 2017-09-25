class Coordinator < ActiveRecord::Base
  has_many(:teams)

  def self.seed()
    jon = Coordinator.create({:name => "Jon Lumpy"})
    team1 = Team.create(:name => "The Tigers", :coordinator_id => jon.id, :wins => 3)
    team2 = Team.create(:name => "The Penguins", :coordinator_id => jon.id, :wins => 35)
    team3 = Team.create(:name => "The Emus", :coordinator_id => jon.id, :wins => 12)
    team4 = Team.create(:name => "The Epicoders", :coordinator_id => jon.id, :wins => 4)
    team5 = Team.create(:name => "The Flamingos", :coordinator_id => jon.id, :wins => 11)
    team6 = Team.create(:name => "The Turkeys", :coordinator_id => jon.id, :wins => 13)
  end

end
