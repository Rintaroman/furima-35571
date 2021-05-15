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
- has_many :histories


## items テーブル

| Colum              | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| product            | string     | null: false       |
| content            | text       | null: false       |
| price              | integer    | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| time_required_id   | integer    | null: false       |
| user               | references | foreign_key: true |

### association

- belongs_to :user
- has_many :comments
- has_one :history


## comments テーブル

| Colum    | Type       | Options           |
| -------- | ---------- | ----------------- |
| comments | text       | null: false       |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### association

- belongs_to :item
- belongs_to :user


## buyers テーブル

| Colum         | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| history       | references | foreign_key: true |

### association
belongs_to :history



## histories テーブル

| Colum | Type       | Options           |
| ----- | ---------- | ----------------- |
| user  | references | foreign_key: true |
| item  | references | foreign_key: true |

### association

- belongs_to :user
- belongs_to :item
- has_one :buyer