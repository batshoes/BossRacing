class AddStatusToChallenge < ActiveRecord::Migration[5.2]
  def up
      execute <<-SQL
        CREATE TYPE challenge_statuses AS ENUM ('pending', 'accepted', 'rejected', 'completed');
        ALTER TABLE challenges ADD status challenge_statuses default 'pending';
      SQL
    end

    def down
      execute <<-SQL
        DROP TYPE challenge_statuses;
      SQL
      remove_column :challenges, :status
    end
end
