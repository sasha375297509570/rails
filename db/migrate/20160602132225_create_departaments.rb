class CreateDepartaments < ActiveRecord::Migration
  def change
    create_table :departaments do |t|
      t.string :name

    end
  end
end