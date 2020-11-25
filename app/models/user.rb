class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    validates :nickname, :introduction, :birth_day, :image, :address
  end

  has_one_attached :image, dependent: :destroy
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :sns_credential, dependent: :destroy

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email:    auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
