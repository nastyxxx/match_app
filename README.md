# Database

## users table

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| introduction | text   | null: false |
| birth_day    | date   | null: false |
| address      | string | null: false |
| latitude     | float  |             |
| longitude    | float  |             |

### Association

 - has_many :room_users, dependent: :destroy
 - has_many :rooms, through: room_users
 - has_many :messages, dependent: :destroy
 - has_one_attached :image
 - has_many :sns_credential, dependent: :destroy

 ## sns_credentials table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

 - belongs_to :user, optional: true

## rooms table

| Column   | Type     | Options       |
| -------- | -------- | ------------- |
| name     | string   | null: false   |

### Association

 - has_many :room_users
 - has_many :users, through: room_users
 - has_many :messages, dependent: :destroy

## room_users table

| Column   | Type      | Options                        |
| -------- | ----------| ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| room     | reference | null: false, foreign_key: true |

 - belongs_to :room, optional: true
 - belongs_to :user, optional: true

## messages table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

 - belongs_to :room
 - belongs_to :user
 - has_one_attached :image
