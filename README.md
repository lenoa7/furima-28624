# テーブル設計

## users テーブル

| Column           | Type       | options    |
| ---------------- | ---------- | ---------- |
| nickname         | string     | null:false |
| email            | string     | null:false |
| password         | string     | null:false |
| first_name       | string     | null:false |
| last_name        | string     | null:false |
| first_name_kana  | string     | null:false |
| last_name_kana   | string     | null:false |
| birth_date       | date       | null:false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null:false, foreign_key: true |
| name             | string     | null:false                    |
| introduce        | text       | null:false                    |
| category_id      | integer    | null:false                    |
| condition_id     | integer    | null:false                    |
| status_id        | integer    | null:false                    |
| delivery_fee_id  | integer    | null:false                    |
| prefecture_id    | integer    | null:false                    |
| delivery_days_id | integer    | null:false                    |
| price            | integer    | null:false                    |

### Association

- has_many :comments
- has_one :purchase
- belongs_to :user
- belong_to_active_hash :category
- belong_to_active_hash :condition
- belong_to_active_hash :status
- belong_to_active_hash :delivery_fee
- belong_to_active_hash :prefecture
- belong_to_active_hash :delivery_days

## comments テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null:false, foreign_key: true |
| item             | references | null:false, foreign_key: true |
| message          | text       | null:false                    |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null:false, foreign_key: true |
| item             | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| order            | references | null:false,foreign_key: true  |
| post_code        | string     | null:false                    |
| city             | string     | null:false                    |
| house_number     | string     | null:false                    |
| building_name    | string     |                               |
| phone_number     | string     | null:false                    |
| prefecture_id    | integer    | null:false                    |

### Association

- belong_to :order
- belong_to_active_hash :prefecture
