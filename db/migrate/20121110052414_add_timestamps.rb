class AddTimestamps < ActiveRecord::Migration
  def up
    change_table :countries do |t|
      t.timestamps
    end
    execute "update countries set created_at = current_timestamp(), updated_at = current_timestamp()"
    change_table :cities do |t|
      t.timestamps
    end
    execute "update cities set created_at = current_timestamp(), updated_at = current_timestamp()"
    change_table :languages do |t|
      t.timestamps
    end
    execute "update languages set created_at = current_timestamp(), updated_at = current_timestamp()"
  end

  def down
    remove_column :countries, :created_at
    remove_column :countries, :updated_at
    remove_column :cities, :created_at
    remove_column :cities, :updated_at
    remove_column :languages, :created_at
    remove_column :languages, :updated_at
  end
end
