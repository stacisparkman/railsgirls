class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string :shape
      t.text :description
      t.string :season
      t.integer :rank

      t.timestamps
    end
  end
end
