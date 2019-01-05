class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    Event.create(name: "5km Race", description: "Sprint to 5km for time.")
    Event.create(name: "500m Race", description: "Sprint to 500m for time.")
    Event.create(name: "10 minute Race", description: "Endurance over 10 minutes for distance.")
  end
end
