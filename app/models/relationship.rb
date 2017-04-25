class Relationship < ApplicationRecord
  belong_to :follower, class_name: User.name
  belong_to :followed, class_name: User.name

  validates :follower, presence: true
  validates :followed, presence: true
end
