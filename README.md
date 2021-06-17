# テーブル設計

## users テーブル
| Column                 | Type       | Options                    |
| ---------------------- | ---------- | -------------------------- |
| nickname               | string     | null: false                |
| email                  | string     | null]: false, unique: true |
| encrypted_password     | string     | null: false                |
| family_name            | string     | null: false                |
| first_name             | string     | null: false                |
| family_name_kana       | string     | null: false                |
| first_name_kana        | string     | null: false                |
| birthday               | date       | null: false                |
### Association
has_many: item
has_one: buyer

## items テーブル
| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| info                   | text       | null: false       |
| category_id            | integer    | null: false       |
| shipping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| price                  | integer    | null: false       |
| user                   | references | foreign_key: true |
### Association
has_one: buyer
belongs_to: user

## orders テーブル
| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| portal_code              | string     | null: false       |
| prefecture_id            | integer    | null: false       |
| city                     | string     | null: false       |
| address                  | string     | null: false       |
| building                 | string     |                   |
| phone_number             | string     | foreign_key: true |
| buyer                    | references | foreign_key: true |
### Association
belongs_to: buyer

## buyers テーブル
| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| item                     | references | foreign_key: true |
| user                     | references | foreign_key: true |
### Association
belongs_to: user
belongs_to: item