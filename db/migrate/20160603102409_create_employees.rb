class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.references :departament, index: true, foreign_key: true

    end
  end
end
