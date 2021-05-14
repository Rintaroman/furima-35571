# テーブル設計

## users テーブル

| Colum              | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| name               | string | null: false  |
| first_name         | string | null: false  |
| name_kana          | string | null: false  |
| first_name_kana    | string | null: false  |
| birthday           | date   | null: false  |

### association

- has_many :items
- has_many :comments
- belongs_to :buyers


## items テーブル

| Colum   | Type    | Options     |
| ------- | ------- | ----------- |
| product | string  | null: false |
| item_id | integer | null: false |
| price   | int     | null: false |

### association

- belongs_to :user
- belongs_to :buyer
- has_many :comments


## comments テーブル

| Colum    | Type | Options     |
| -------- | ---- | ----------- |
| comments | text | null: false |

### association

- belongs_to :item
- belongs_to :user


## buyers テーブル

| Colum           | Type    | Options     |
| --------------- | ------- | ----------- |
| postal_code     | string  | null: false |
| buyer_id        | integer | null: false |
| city            | string  | null: false |
| billing_address | string  | null: false |
| phone_number    | string  | null: false |


### association

- has_one :user
- has_one :item
