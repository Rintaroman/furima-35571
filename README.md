# テーブル設計

## users テーブル

| Colum              | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| first_name         | string | null: false               |
| name_kana          | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### association

- has_many :items
- has_many :comments
- belongs_to :buyers
- belongs_to :history


## items テーブル

| Colum            | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| product          | string     | null: false       |
| content          | text       | null: false       |
| price            | int        | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| delivery_id      | integer    | null: false       |
| area_id          | integer    | null: false       |
| time_required_id | integer    | null: false       |
| users_id         | references | foreign_key: true |

### association

- belongs_to :user
- belongs_to :buyer
- has_many :comments
belongs_to :history


## comments テーブル

| Colum    | Type       | Options           |
| -------- | ---------- | ----------------- |
| comments | text       | null: false       |
| users_id | references | foreign_key: true |
| items_id | references | foreign_key: true |

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


## histories テーブル

| Colum    | Type       | Options           |
| -------- | ---------- | ----------------- |
| users_id | references | foreign_key: true |
| items_id | references | foreign_key: true |

### association

- has_many :users
- has_many :items