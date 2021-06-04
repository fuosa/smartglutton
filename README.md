# README

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
has_many: cart_items


## orders テーブル

| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| bill             | integer    | null: false                    |
| payment_type     | integer    | null: false                    |
| receive_type     | integer    | null: false                    |
| phone            | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
has_many: ordered_items
belongs_to: user


## ordered_items テーブル

| column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item         | references | null: false, foreign_key: true |
| order        | references | null: false, foreign_key: true |
| item_qty     | integer    | null: false                    |
| price        | integer    | null: false                    |
| item_status  | integer    | null: false                    |

### Association
belongs_to: orders
belongs_to: items



## cart_items テーブル

| column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| item_qty  | integer    | null: false                    |

### Association
belongs_to: users
belongs_to: items



## items テーブル

| column        |  Type      | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| genre         | references | null: false, foreign_key: true |

### Association
has_many: cart_items
has_many: ordered_items
belongs_to: categories


## categories テーブル

| column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| category_name     | integer    | null: false |
| category_status   | integer    | null: false |

### Association
has_many: items

=======

#アプリケーション名
「SmartGlutton」

＃概要
レストランなどの余った食材を、無駄にする事なくシェア（売り買いすることのできるフードシェアアプリケーションです。

＃制作背景
食品ロスを減らして