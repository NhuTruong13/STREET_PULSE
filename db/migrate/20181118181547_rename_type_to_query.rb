class RenameTypeToQuery < ActiveRecord::Migration[5.2]
  def change
    rename_column :searches, :type, :query
  end
end
