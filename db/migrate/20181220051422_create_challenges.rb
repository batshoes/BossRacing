class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.string :event_name
      t.datetime :start_time
      t.timestamps
    end
  end
end
