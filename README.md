# テーブル設計

## users テーブル
| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| nickname     | string  | not: null   |
| email        | string  | not: null   |
| password     | string  | not: null   |
| name         | string  | not: null   |
| name_reading | string  | not: null   |
| birthday     | integer | not: null   |

## items テーブル
| Column                   | Type       | Options   |
| ------------------------ | ---------- | --------- |
| image                    |            |           |
| item_name                | text       | not: null |
| item_info                | text       | not: null |
| item_category            | integer    | not: null |
| item_sales_status        | integer    | not: null |
| item_shipping_fee_status | integer    | not: null |
| item_prefecture          | integer    | not: null |
| item_scheduled_delivery  | integer    | not: null |
| tem_price                | integer    | not: null |
| add_tax_price            | integer    | not: null |
| profit                   | integer    | not: null |
| user                     | references |           |

## comments テーブル
| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | not: null   |
| user       | references |             |
| prototype  | references |             |

## orders テーブル
| Column                   | Type       | Options   |
| ------------------------ | ---------- | --------- |
| card_number              | text       | not: null |
| card_exp_month           | text       | not: null |
| card_exp_year            | text       | not: null |
| card_cvc                 | text       | not: null |
| portal_code              | text       | not: null |
| prefecture               | integer    | not: null |
| city                     | text       | not: null |
| address                  | text       | not: null |
| building                 | text       |           |
| phone_number             | text       | not: null |
| items                    | references |           |