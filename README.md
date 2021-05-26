# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル（ユーザー情報）

| Column                | Type   | Options                       |
| --------              | ------ | ----------------------------- |
| nickname              | string | null: false                   |
| email                 | string | null: false, unique: true     |
| password              | string | null: false                   |
| password_confirmation | string | null: false                   |
| last_name             | string | null: false                   |
| first_name            | string | null: false                   |
| last_name_kana        | string | null: false                   |
| first_name_kana       | string | null: false                   |
| birth_day             | date   | null: false                   |
### Association

- has_many :purchase_records
- has_many :items

## itemsテーブル（商品情報）

| Column                   | Type       | Options                         |
| -------------------------| ------     | ---------------------------     |
| item_image               | string     | null: false                     |
| item_name                | string     | null: false                     |
| item_info                | text       | null: false                     |
| item_category            | integer    | null: false                     |
| item_sales_status        | integer    | null: false                     |
| item_shipping_fee_status | integer    | null: false                     |
| item_prefecture          | integer    | null: false                     |
| item_scheduled_delivery  | integer    | null: false                     |
| item_price               | integer    | null: false                     |
| seller_user_id           | references | null: false, foreign_key: true  |
### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル(購入記録)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses

## shipping_addressesテーブル（発送先住所）

| Column       | Type       | Options                        |
| ---------    | ---------- | -----------------------------  |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| purchase_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase