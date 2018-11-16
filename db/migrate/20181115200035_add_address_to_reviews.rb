class AddAddressToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :address, :string
    rename_column :reviews, :latitude_review, :latitude
    rename_column :reviews, :longitude_review, :longitude
  end
end
