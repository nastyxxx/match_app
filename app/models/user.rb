class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :nickname, :introduction, :birth_day, :image
  end

  has_one_attached :image, dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :sns_credential
end
