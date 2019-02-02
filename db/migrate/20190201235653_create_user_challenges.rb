class CreateUserChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_challenges do |t|
      t.integer :challenger_id
      t.integer :challengee_id
      t.references :challenges
      t.timestamps
    end
  end
end
