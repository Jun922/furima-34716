# テーブル設計

## users テーブル
| Column                 | Type    | Options      |
| ---------------------- | ------- | ------------ |
| nickname               | string  | null: false  |
| email                  | string  | unique: true |
| encrypted_password     | string  | null: false  |
| name_sei               | string  | null: false  |
| name_mei               | string  | null: false  |
| name_reading_sei       | string  | null: false  |
| name_reading_mei       | string  | null: false  |
| birthday               | date    | null: false  |

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
| user_id                | references | foreign: true |

## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user_id    | references |             |
| item_id    | references |             |

## orders テーブル
| Column                   | Type       | Options       |
| ------------------------ | ---------- | ------------- |
| portal_code_id           | string     | null: false   |
| prefecture_id            | integer    | null: false   |
| city                     | string     | null: false   |
| address                  | string     | foreign: true |
| building                 | string     | foreign: true |
| phone_number             | string     | foreign: true |
| item_id                  | references | foreign: true |