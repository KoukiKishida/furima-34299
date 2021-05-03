# README

# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| name_kana    | string | null: false |


### Association

- has_many :comment
- has_many :product
- has_one :shipping_address

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
| description           | text       |                                |
| category              | string     | null: false                    |
| status                | string     | null: false                    |
| burden                | string     | null: false                    |
| shipment_source       | string     | null: false                    |
| days                  | string     | null: false                    |
| price                 | string     | null: false                    |
| image                 |            |                                |
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comment
- has_one :shipping_address
- has_one :purchase_record


## shipping_address テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product


## purchase_record テーブル

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
- has_one :product

