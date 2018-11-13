class CreateCommunes < ActiveRecord::Migration[5.2]
  def change
    create_table :communes do |t|
      t.string :name
      t.text :description
      t.integer :zip_code

      t.timestamps
    end
  end
end
