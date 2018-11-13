class Commune < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :searches, dependent: :destroy
end
