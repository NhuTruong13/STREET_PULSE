class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :street_review_content
      t.text :commune_review_content
      t.string :street_review_title
      t.string :commune_review_title
      t.integer :street_review_average_rating
      t.integer :commune_review_average_rating
      t.float :latitude_review
      t.float :longitude_review
      t.integer :no_likes
      t.references :user, foreign_key: true
      t.references :commune, foreign_key: true

      t.timestamps
    end
  end
end
