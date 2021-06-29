# README

# アプリケーション名
「SmartGlutton：スマートグラトン」

# 概要
飲食店で余っている野菜類を売りたい人と買いたい人でシェアが可能なアプリ
＊地域を絞って実施することにより、食材料金のみで配達料は不要

# 利用方法
【食材を消費したい飲食店】
ユーザー登録を行い、余っている食事を掲載し、販売する。受け取りにきた飲食店の評価を行う。

【食材を必要とする飲食店】
ユーザー登録を行い、必要な食材を検索し、食材が見つかったら、商品詳細ページから商品購入ができる。コメント蘭から商品に対する質問や値段交渉などを行い、承諾されれば食材を出品者店舗へ取りに行く。受け取った飲食店の評価を行う。


# 制作背景
食品ロスを減らし、美味しい食材を無駄にせず、皆んなで活用していけるようなアプリを作りたいと考えました。また、コロナの影響による、休業や時短営業により、多くの食材が無駄になっている現状もあるので、飲食店同士で、効率よく食材の売り買いを行い、飲食店で余った食材の廃棄を減らすことを目標としています。さらに、SGDsの目標達成にも貢献できるのではないかと考え開発しました。

# 洗い出した要件定義


|"優先順位（高：3、中：2、低：1）" |  機能 | 目的 |   詳細  |  ストーリー(ユースケース) |  見積もり（所要時間）|
| --------------------------- | -----|----- |--------| ---------------------- | ---------------- |
| 3 | DB設計 | フードシェアアプリを実現するために必要な、データベースの設計を行う| | | 10 |
| 3 | ユーザー管理機能 | 出品者、購入者の管理を行うため | トップページのボタンを押すと、新規登録またはログインすることができる | 商品を売り買いしたいユーザーは、新規登録またはログインする必要がある | 10 |
| 3 | 商品出品機能 | 商品出品ページから売りたい商品をログインしているユーザーが出品できるようにする | ログインしたユーザーが商品を出品することができる | ユーザーはログインした状態で、商品出品ボタンを押し、必要情報を入力すると商品の出品ができる | 10 |
| 3 | 商品詳細表示機能 | 商品出品時に登録した情報（商品名、商品画像、値段、出品者、カテゴリー、商品の状態、商品の説明）を表示する | ユーザーは商品の画像や価格などの情報を確認することができ、またコメント欄から質問とうも可能である | 商品詳細画面からユーザーは購入したい商品の情報が確認でき、購入画面へ遷移することもできる | 5 |
| 3 | 商品編集・削除機能 | ログイン状態の出品者のみ、出品した商品の編集、削除ができる	登録した情報の更新ができる、また削除したい商品はDBから削除できる | ログインした出品者のみ、自身の商品情報の編集、または商品の削除ができる | 5 |
| 3 | 商品購入機能 | ログイン状態の出品者以外のユーザーが、必要な情報を入力すると、商品を購入できるようにする | ログインしたユーザーは気に入った商品があれば購入することができる | 商品購入画面で必要情報を記入することで、商品の購入が可能となる | 15 |
| 2 | コメント投稿機能 | 商品に対してコメントができる | 商品の購入を検討しているユーザーは、コメント機能を使い出品者へ質問などができる | コメント欄に記入し、送信すると商品出品者に連絡をすることができる | 5 |
| 2 | ユーザーの評価機能 | 商品の出品者と購入者がお互いに評価できる | ユーザーの評価をできるようにする事で、商品取引の質向上を目的とした監視効果が期待できる、フィードバックを得やすくする | 出品者及び購入者は利用したサービスを利用後評価することができる | 5 |
| 1 | 商品検索機能 | 商品検索ができることにより、商品の検索、購入が容易になる | 商品名を検索欄に記入することで、商品の検索ができる | ユーザーはキーワード検索で自分の探している商品を簡単に探すことができる | 5 |


# 実装予定の内容
・レビュー評価機能
・検索機能
・店舗のマップ表示機能



# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| data_of_birth      | data    | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
has_many: orders
has_many: items
has_many: comments


## orders テーブル

| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
has_one: ordered_item
belongs_to: user
belongs_to: item



## ordered_items テーブル

| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order            | references | null: false, foreign_key: true |
| item_qty         | integer    | null: false                    |
| payment_type     | integer    | null: false                    |
| received_type    | integer    | null: false                    |
| phone            | string     | null: false                    |

### Association
belongs_to: order



## items テーブル

| column            |  Type      | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| description       | text       | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| category_name     | integer    | null: false                    |
| category_status   | integer    | null: false                    |

### Association
has_many: ordered_items
has_many: comments
belongs_to: user




## comments テーブル
| column            |  Type      | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |
| comment           | text       |                                |
### Association
belongs_to: item
belongs_to: user
