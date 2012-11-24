class CountriesUsersHasManyThrough < ActiveRecord::Migration
  def up
    drop_table :countries_users
    create_table :watched_countries, :force => true, :id => false do |t|
      t.string :user_id, :null => false
      t.string :country_id, :null => false
    end
    execute 'alter table watched_countries add primary key (user_id, country_id)'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
