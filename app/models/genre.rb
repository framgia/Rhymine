class Genre < ApplicationRecord
  has_many :songs, dependent: :destroy

  validates :name, presence: true, length: {maximum: 50}
end
