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
| birth_date       | datetime   | null:false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | references | null:false, foreign_key: true |
| image            | string     | null:false                    |
| name             | string     | null:false                    |
| introduce        | text       | null:false                    |
| category_id      | integer    | null:false                    |
| condition_id     | integer    | null:false                    |
| status_id        | integer    | null:false                    |
| delivery_fee_id  | integer    | null:false                    |
| prefecture_id    | integer    | null:false                    |
| delivery_days    | integer    | null:false                    |
| price            | integer    | null:false                    |

### Association

- has_many :comments
- has_one :purchase
- belong_to :user
- belong_to_active_hash :category
- belong_to_active_hash :condition
- belong_to_active_hash :status
- belong_to_active_hash :delivery_fee
- belong_to_active_hash :prefecture
- belong_to_active_hash :delivery_days

## comments テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | references | null:false, foreign_key: true |
| item_id          | references | null:false, foreign_key: true |
| message          | text       | null:false                    |

### Association

- belong_to :user
- belong_to :item

## purchases テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | references | null:false, foreign_key: true |
| item_id          | references | null:false, foreign_key: true |

### Association

- belong_to :user
- belong_to :item
- has_one :address

## address テーブル

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| post_code        | integer    | null:false                    |
| city             | string     | null:false                    |
| building_name    | string     | null:false                    |
| phone_number     | integer    | null:false                    |
| prefecture_id    | integer    | null:false                    |

### Association

- belong_to :purchase
- belong_to_active_hash :prefecture

## category

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| category         | string     | null:false                    |

### Association

- has_many :items


## condition

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| condition        | string     | null:false                    |

### Association

- has_many :items

## status

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| status           | string     | null:false                    |

### Association

- has_many :items

## delivery_fee

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| delivery_fee     | string     | null:false                    |

### Association

- has_many :items

## prefecture

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| prefecture       | string     | null:false                    |

### Association

- has_many :items

## delivery_fee

| Column           | Type       | options                       |
| ---------------- | ---------- | ----------------------------- |
| days             | string     | null:false                    |

### Association

- has_many :items