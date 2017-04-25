class Song < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :ratings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy
end
