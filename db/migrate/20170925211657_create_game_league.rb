class CreateGameLeague < ActiveRecord::Migration[5.1]
  def change
    add_column(:teams, :wins, :int)
    add_column(:teams, :losses, :int)
    add_column(:teams, :game_id, :int)

    create_table(:games) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
  end
end
