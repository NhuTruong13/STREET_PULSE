class RemoveCommuneFromSearches < ActiveRecord::Migration[5.2]
  def change
    remove_reference :searches, :commune, index: true, foreign_key: true
  end
end
