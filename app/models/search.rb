class Search < ApplicationRecord
  # the below required by geocode gem
  # so at the moment of saving new search the long/lati will be added based on address
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # below a dirty fix, so that user won't be necessary to save Search instance:
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
end
