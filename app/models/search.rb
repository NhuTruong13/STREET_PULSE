class Search < ApplicationRecord
  # the below required by geocode gem
  # so at the moment of saving new search the long/lati will be added based on address
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
