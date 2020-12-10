# MatchApp

## アプリケーション情報
https://match-app-aws.work/

## 概要
- 作成したマッチング・チャットアプリを紹介します。

## 使用技術

### バックエンド
- Ruby 2.6.5
- Ruby on Rails 6.0.0

### フロントエンド
- HTML
- CSS
- JavaScript,Ajax
- Bootstrap4

### バージョン管理システム
- Github

### 開発環境
- MySQL2
- Docker,Dockr-compose

### 本番環境
- AWS (EC2,S3,Route53,ACM,ELB,VPC)
- unicorn
- nginx
- mariadb
- CircleCD

### テスト
- CircleCI
- Rspec
- rubocop

## MatchApp作成を経ての気づき

### 工夫した点
- クレジットカードを登録しないとチャットルームの作成、個人情報の編集、他人の情報の閲覧が出来ない点
- Google Map APIを用いて住所登録を容易にした点
- ユーザー登録時に、Google、Facebookの認証ができる様にして、ユーザビリティを向上させた点

### 苦労した点
- テスト環境と本番環境でGoogle、Facebook認証の挙動が変わるため、ドメインの取得、SSL証明書の発行を行い、プロトコルをHTTPからHTTPSに変更した点。
- UIを拡充するためBootstrapを導入した点
- 要件定義でどの機能を実装するか選別した点。
- インフラにDocker、Circle CI/CDを導入した点。

以上


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
 - has_one :card, dependent: :destroy

## sns_credentials table

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| provider | string     | null: false                    |
| uid      | string     | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

 - belongs_to :user, optional: true

## cards table

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_token     | string     | null: false                    |
| customer_token | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

 - belongs_to :user

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

### Association

 - belongs_to :room, optional: true
 - belongs_to :user, optional: true

## messages table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

 - belongs_to :room
 - belongs_to :user
 - has_one_attached :image
