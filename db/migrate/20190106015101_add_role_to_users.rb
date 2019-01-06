class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def up
      execute <<-SQL
        CREATE TYPE user_roles AS ENUM ('user', 'admin');
        ALTER TABLE users ADD role user_roles default 'user';
      SQL
    end

    def down
      execute <<-SQL
        DROP TYPE user_roles;
      SQL
      remove_column :users, :role
    end
end
