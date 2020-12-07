# frozen_string_literal: true

class RoomUser < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :user, optional: true
end
