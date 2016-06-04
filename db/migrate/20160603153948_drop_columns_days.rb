class DropColumnsDays < ActiveRecord::Migration
  def change
    
	execute "ALTER TABLE days DROP COLUMN number;"
	execute "ALTER TABLE days DROP COLUMN month;"
	execute "ALTER TABLE days DROP COLUMN year;"
  end
end
