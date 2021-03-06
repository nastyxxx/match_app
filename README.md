# MatchApp

## 概要

「マッチングアプリ」
<br>シンプルなUI/UX、マッチング相手との距離がわかる様なアプリケーションにしました。

## 制作の背景

今まで出会うことの無かった人達が出会う感動を生み出したい、2020年現在コロナの影響で人とのつながりが希薄になる中で、少しでも楽しんでいただきたいと思い作成しました。

## URL

https://match-app-aws.work/

## テストアカウント

### ユーザー情報

- メールアドレス: mill@mill
- パスワード: sasa12

### テストカード情報
- 番号：4242424242424242
- 期限：03/24
- セキュリティコード：123

## 機能一覧

- ログイン機能（devise、Google、Facebookでのログイン）
  * Google、Facebookでログインするとパスワード入力不要。

[![Image from Gyazo](https://i.gyazo.com/a14a005840b7e1af32a5a53f23510516.png)](https://gyazo.com/a14a005840b7e1af32a5a53f23510516)

- 位置情報の保存・共有（Google Map API）
  * 相手の詳細を見ると、位置情報が分かる。また、自身の位置情報の保存・更新が出来る。

[![Image from Gyazo](https://i.gyazo.com/e0903d7acb8c7648d6004d42c0497dfd.png)](https://gyazo.com/e0903d7acb8c7648d6004d42c0497dfd)

- 決済機能（Payjp）
  * クレジットカードを登録しないと、チャット、個人情報編集が出来ない。

[![Image from Gyazo](https://i.gyazo.com/749dab47e1515da358657eb59f884002.png)](https://gyazo.com/749dab47e1515da358657eb59f884002)

- メッセージ即時更新機能
  * ActionCableを用いてメッセージを即時更新。

[![Image from Gyazo](https://i.gyazo.com/6f0f2143471eba8f838127d9030c169c.png)](https://gyazo.com/6f0f2143471eba8f838127d9030c169c)

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
- MySQL
- Docker,Docker-compose

### 本番環境
- AWS (EC2,S3,RDS,Route53,ACM,ELB,VPC,CloudFront)
- unicorn
- nginx
- mariadb
- CircleCD

### テスト
- CircleCI
- Rspec
- rubocop

### その他機能
- Google Map API
- geocoder
- capistrano
- ActionCable

## MatchApp作成を経ての気づき

### 工夫した点
- クレジットカードを登録しないとチャットルームの作成、個人情報の編集、他人の情報の閲覧が出来ない点
- Google Map APIを用いて住所登録を容易にした点
- ユーザー登録時に、Google、Facebookの認証ができる様にして、ユーザビリティを向上させた点

### 苦労した点
- テスト環境と本番環境でGoogle、Facebook認証の挙動が変わるため、ドメインの取得、SSL証明書の発行を行い、プロトコルをHTTPからHTTPSに変更した点。
- UIを拡充するためBootstrapを導入した点
- 要件定義でどの機能を実装するか選別した点。
- インフラにAWS、開発環境にDocker、Docker-compose、自動テスト・デプロイにCircle CI/CDを導入した点。

# データベース概要

![](.drawio.png)

# インフラ環境

![](AWS.png)

# About me
 
 5年間アパレル会社で勤務しておりました！現在念願のエンジニアとして勤務中です！
