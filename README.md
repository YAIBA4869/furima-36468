## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

### Association

* has_many :items
* has_many :purchases

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product_name                        | string     | null: false                    |
| product_description                 | text       | null: false                    |
| price                               | integer    | null: false                    |
| shipping_charges_id                 | integer    | null: false                    |
| product_condition_id                | integer    | null: false                    |
| shipping_area_id                    | integer    | null: false                    |
| days_to_ship_id                     | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| category_id                         | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase_record

## purchases table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| postal_code                         | string     | null: false                    |
| city                                | string     | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| house_number                        | string     | null: false                    |
| building_name                       | string     |                                |
| phone_number                        | string     | null: false                    |
| purchase_record                     | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase


## purchase_record table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item                                | references | null: false, foreign_key: true |
| user                                | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase_record