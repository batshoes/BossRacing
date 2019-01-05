class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.references :event
      t.datetime :start_time
      t.timestamps
    end
  end
end
