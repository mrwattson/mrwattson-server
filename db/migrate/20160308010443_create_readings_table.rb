class CreateReadingsTable < ActiveRecord::Migration
  def change
    create_table :readings do |table|
      table.float :raw

      table.timestamps null: false
    end
  end
end
