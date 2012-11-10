class CountryLanguageManyToMany < ActiveRecord::Migration
  def up
    rename_table :languages, :spoken_languages
    create_table :languages, :force => true do |t|
      t.string :name, :null => false
      t.timestamps
    end
    execute <<-SQL
      insert into languages (name, created_at, updated_at)
      select distinct language, current_timestamp(), current_timestamp()
        from spoken_languages
       order by language
    SQL

    add_column :spoken_languages, :language_id, :integer
    execute <<-SQL
      update spoken_languages cl
         set language_id =
             (
               select id
                 from languages
                where name = cl.language
             ),
             updated_at = current_timestamp()
    SQL
    execute "alter table spoken_languages drop primary key"
    remove_column :spoken_languages, :language
    change_column_null :spoken_languages, :language_id, false
    execute "alter table spoken_languages add primary key (country_id, language_id)"
  end

  def down
    execute "alter table spoken_languages drop primary key"
    add_column :spoken_languages, :language, :string, :limit => 30, :default => ""
    execute <<-SQL
      update spoken_languages cl
         set language =
             (
               select name
                 from languages
                where id = cl.language_id
             ),
             updated_at = current_timestamp()
    SQL
    remove_column :spoken_languages, :language_id
    change_column_null :spoken_languages, :language, false
    execute "alter table spoken_languages add primary key (country_id, language)"

    drop_table :languages
    rename_table :spoken_languages, :languages
  end
end
