# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first-name         | string | null: false               |
| last-name          | string | null: false               |
| first-name-kana    | string | null: false               |
| last-name-kana     | string | null: false               |
| birth-data         | integer| null: false               |


### Association

- has_many :orders
- has_many :items


## items テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| item-name               | string    | null: false                                  |
| item-info               | text      | null: false                                  |
| item-category           | integer   | null: false                                  |
| item-sales-status       | integer   | null: false                                  |
| item-shopping-fee-status| integer   | null: false                                  |
| item-prefecture         | integer   | null: false                                  |
| item-scheduled-delivery | integer   | null: false                                  |
| item-price              | integer   | null: false                                  |
| user                    | references| null: false, foreign_key: true               |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column                  | Type      | Options                                      |
| ----------------------- | --------- | -------------------------------------------- |
| item                    | references| null: false, foreign_key: true               |
| buyer                   | references| null: false, foreign_key: true               |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column             | Type       | Options                                      |
| ------------------ | ---------- | -------------------------------------------- |
| postal-code        | string     | null: false                                  |
| prefecture         | string     | null: false                                  |
| city               | string     | null: false                                  |
| house-number       | string     | null: false                                  |
| building           | string     | null: false                                  |
| phone-number       | string     | null: false                                  |
| order              | references | null: false, foreign_key: true               |


### Association

- belongs_to :order



