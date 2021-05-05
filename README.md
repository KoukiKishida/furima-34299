# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| --------           | ------  | ------------------------ |
| nickname           | string  | null: false,unique: true |
| email              | string  | null: false,unique: true |
| password           | string  | null: false              |
| encrypted_password | string  | null: false              |
| name_sei           | string  | null: false              |
| name_mei           | string  | null: false              |
| name_sei_kana      | string  | null: false              |
| name_mei_kana      | string  | null: false              |
| year               | integer | null: false              |
| month              | integer | null: false              |
| date               | integer | null: false              |

### Association

- has_many :comment
- has_many :product
- has_many :purchase_record

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
| shipment_source_id    | integer    | null: false                    |
| day_id                | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comment
- has_one :purchase_record

## purchase_record テーブル

| Column             | Type       | Options                        |
| -------            | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |
| shipping_address   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- belongs_to :shipping_address


## shipping_address テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| prefectures           | string     | null:false                     | 
| municipalities        | string     | null:false                     |
| building              | string     | null: false                    |
| phone_number          | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |
| product               | references | null: false, foreign_key: true |

### Association
- has_one :purchase_record

