class CreateTeamLeague < ActiveRecord::Migration[5.1]
  def change
    create_table(:coordinators) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    create_table(:teams) do |t|
      t.column(:name, :string)
      t.column(:coordinator_id, :int)

      t.timestamps()
    end

    create_table(:players) do |t|
      t.column(:name, :string)
      t.column(:team_id, :int)

      t.timestamps()
    end
  end
end
