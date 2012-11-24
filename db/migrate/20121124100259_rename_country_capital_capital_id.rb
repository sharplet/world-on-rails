class RenameCountryCapitalCapitalId < ActiveRecord::Migration
  def change
    rename_column :countries, :capital, :capital_id
  end
end
