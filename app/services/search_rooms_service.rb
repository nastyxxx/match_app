# frozen_string_literal: true

class SearchRoomsService
  def self.search(search)
    if search == ''
      Room.all
    else
      Room.where('name LIKE(?)', "%#{search}%")
    end
  end
end
