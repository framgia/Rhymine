class Song < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  has_many :ratings, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reports, dependent: :destroy

  mount_uploader :audio, AudioUploader

  validates :title, presence: true
  validates :artist, presence: true
  validates :genre, presence: true

  scope :search_song, -> search_param do
    where "title LIKE ? OR artist LIKE ?",
      "%#{search_param}%", "%#{search_param}%" if search_param.present?
  end
end
