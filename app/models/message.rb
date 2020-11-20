class Message < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :user, optional: true
  has_one_attached :image, dependent: :destroy

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end