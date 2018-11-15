class Commune < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
