class Review < ApplicationRecord
  belongs_to :user
  belongs_to :search
  belongs_to :commune
  has_many :pictures, dependent: :destroy
  has_many :answers, dependent: :destroy
end
