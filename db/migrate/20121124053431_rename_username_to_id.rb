class RenameUsernameToId < ActiveRecord::Migration
  def up
    remove_column :users, :id
    rename_column :users, :username, :id
    execute "alter table users add primary key (id)"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
