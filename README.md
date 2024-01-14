# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| item_name          | string    | null: false |
| item_description   | text      | null: false |
| price              | integer   | null: false |
| exhibitor          | string    | null: false |
| category           | string    | null: false |
| item_condition     | string    | null: false |
| delivery_price     | integer   | null: false |
| ships_from         | string    | null: false |
| delivery_criterion | string    | null: false |

### Association

- belongs_to :users
- has_one    :orders

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_user_id   | references | null: false, foreign_key: true |
| item_name_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postcode      | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| block         | integer    | null: false                    |
| building      | string     |                                |

### Association

- belongs_to :orders