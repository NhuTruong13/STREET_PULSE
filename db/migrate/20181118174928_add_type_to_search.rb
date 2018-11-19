class AddTypeToSearch < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :type, :string
  end
end
