# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image, dependent: :destroy

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
