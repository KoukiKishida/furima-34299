# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| --------           | ------  | ------------------------ |
| nickname           | string  | null: false,unique: true |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| name_sei           | string  | null: false              |
| name_mei           | string  | null: false              |
| name_sei_kana      | string  | null: false              |
| name_mei_kana      | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :comments
- has_many :products
- has_many :purchase_records

## comment テーブル

| Column    | Type       | Options                        |
| ------    | ------     | ------------------------------ |
| text      | text       |                                |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product


## product テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| product_name          | string     | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| burden_id             | integer    | null: false                    |
| prefectures_id        | integer    | null: false                    |
| day_id                | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_one :purchase_record

## purchase_record テーブル

| Column             | Type       | Options                        |
| -------            | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- belongs_to :shipping_address


## shipping_address テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| prefectures_id        | integer    | null:false                     | 
| municipalities        | string     | null:false                     |
| building              | string     |                                |
| phone_number          | string     | null: false                    |
| purchase_record       | references | null: false, foreign_key: true |

### Association
- has_one :purchase_record

