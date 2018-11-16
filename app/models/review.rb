class Review < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  belongs_to :user
  belongs_to :search
  belongs_to :commune
  has_many :pictures, dependent: :destroy
  has_many :answers, dependent: :destroy
end
