class AddCountriesUsersTable < ActiveRecord::Migration
  def change
    create_table :countries_users, :force => true, :id => false do |t|
      t.string :country_id, :null => false
      t.references :user, :null => false
    end
  end
end
