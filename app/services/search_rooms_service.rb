# frozen_string_literal: true

class SearchRoomsService
  def self.search(search)
    if search != ''
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
