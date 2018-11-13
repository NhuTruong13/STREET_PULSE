class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :photo, :string
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
