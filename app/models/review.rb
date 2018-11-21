class Review < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude, address: :address
  belongs_to :user
  belongs_to :search
  belongs_to :commune
  has_many :pictures, dependent: :destroy
  has_many :answers, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  # validates :street_review_title, prensence: true
  # validates :street_review_average_rating, prensence: true
  # validates :commune_review_title, prensence: true
  # validates :commune_review_average_rating, prensence: true
end
