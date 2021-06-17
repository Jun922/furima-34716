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
| item                   | references | foreign_key: true          |

## items テーブル
| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| info                   | text       | null: false       |
| category_id            | integer    | null: false       |
| shipping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| price                  | string     | null: false       |
| user                   | references | foreign_key: true |
| buyer                  | references | foreign_key: true |

## orders テーブル
| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| portal_code              | string     | null: false       |
| prefecture_id            | integer    | null: false       |
| city                     | string     | null: false       |
| address                  | string     | foreign_key: true |
| building                 | string     |                   |
| phone_number             | string     | foreign_key: true |
| buyer                    | references | foreign_key: true |

## buyers テーブル
| Column                   | Type       | Options           |
| ------------------------ | ---------- | ----------------- |
| item                     | references | foreign_key: true |
| order                    | references | foreign_key: true |