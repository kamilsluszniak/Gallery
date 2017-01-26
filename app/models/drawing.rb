class Drawing < ApplicationRecord
  belongs_to :user
  mount_uploader :attachment, DrawingUploader
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :attachment, presence: true
end
