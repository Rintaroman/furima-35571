# テーブル設計

## users テーブル

| Colum     | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | date   | null: false |

### association

- has_many :items
- has_many :comments
- belongs_to :buyers


## items テーブル

| Colum           | Type   | Options     |
| --------------- | ------ | ----------- |
| product         | string | null: false |
| category        | text   | null: false |
| condition       | string | null: false |
| delivery_charge | string | null: false |
| area            | string | null: false |
| time_required   | string | null: false |
| price           | int    | null: false |

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

| Colum           | Type   | Options |
| --------------- | ------ | ------- |
| credit_num      | string |         |
| credit_expire   | string |         |
| credit_code     | string |         |
| postal_code     | string |         |
| prefecture      | string |         |
| city            | string |         |
| billing_address | string |         |
| phone_number    | string |         |


### association

- has_one :user
- has_one :item
