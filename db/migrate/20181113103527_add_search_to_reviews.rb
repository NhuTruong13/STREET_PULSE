class AddSearchToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :search, foreign_key: true
  end
end
