# テーブル設計

## users テーブル
| Column                 | Type    | Options                    |
| ---------------------- | ------- | -------------------------- |
| nickname               | string  | null: false                |
| email                  | string  | null]: false, unique: true |
| encrypted_password     | string  | null: false                |
| family_name            | string  | null: false                |
| first_name             | string  | null: false                |
| family_name_kana       | string  | null: false                |
| first_name_kana        | string  | null: false                |
| birthday               | date    | null: false                |
| buyer                  | references | foreign: true           |

## items テーブル
| Column                 | Type       | Options       |
| ---------------------- | ---------- | ------------- |
| image                  |            |               |
| name                   | string     | null: false   |
| info                   | text       | null: false   |
| category_id            | integer    | null: false   |
| shipping_fee_status_id | integer    | null: false   |
| prefecture_id          | integer    | null: false   |
| scheduled_delivery_id  | integer    | null: false   |
| price                  | integer    | foreign: true |
| user                   | references | foreign: true |

## orders テーブル
| Column                   | Type       | Options       |
| ------------------------ | ---------- | ------------- |
| portal_code_id           | string     | null: false   |
| prefecture_id            | integer    | null: false   |
| city                     | string     | null: false   |
| address                  | string     | foreign: true |
| building                 | string     | foreign: true |
| phone_number             | string     | foreign: true |
| item                     | references | foreign: true |

## buyers テーブル
| Column                   | Type       | Options       |
| ------------------------ | ---------- | ------------- |
| user                     | references | foreign: true |
| item                     | references | foreign: true |