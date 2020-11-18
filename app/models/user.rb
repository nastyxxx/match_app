class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :introduction, :birth_day
  end

  has_one_attached :image
end
