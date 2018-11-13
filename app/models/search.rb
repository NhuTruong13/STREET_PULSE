class Search < ApplicationRecord
  belongs_to :user
  belongs_to :commune
  has_many :reviews, dependent: :destroy
end
