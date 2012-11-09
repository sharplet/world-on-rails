class ImportSchema < ActiveRecord::Migration
  def up
    File.read('db/baseline.sql').split(/;\n+/m).each do |stmt|
      execute stmt
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
