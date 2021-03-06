# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :card_token, :customer_token
  end
end
