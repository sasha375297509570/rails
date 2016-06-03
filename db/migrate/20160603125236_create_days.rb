class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :number
      t.integer :month
      t.integer :year
      
    end
  end
end
