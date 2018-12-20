class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :challenge
      t.references :user
      t.timestamps
    end
  end
end
