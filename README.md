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
| encrypted_password    | string | null: false                   |
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
| name                     | string     | null: false                     |
| info                     | text       | null: false                     |
| category_id              | integer    | null: false                     |
| sales_status_id          | integer    | null: false                     |
| shipping_fee_status_id   | integer    | null: false                     |
| prefecture_id            | integer    | null: false                     |
| scheduled_delivery_id    | integer    | null: false                     |
| price                    | integer    | null: false                     |
| user                     | references | null: false, foreign_key: true  |
### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル(購入記録)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル（発送先住所）

| Column        | Type       | Options                        |
| ---------     | ---------- | -----------------------------  |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase