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
| price                               | string     | null: false                    |
| shipping_charges                    | string     | null: false                    |
| product_condition                   | text       | null: false                    |
| shipping_area                       | text       | null: false                    |
| days_to_ship                        | string     | null: false                    |
| category                            | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchases

## purchases table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| postal_code                         | string     | null: false                    |
| city                                | string     | null: false                    |
| prefecture                          | string     | null: false                    |
| house_number                        | string     | null: false                    |
| building_name                       | string     | true                           |
| phone_number                        | string     | null: false                    |
| prefecture                          | references | null: false, foreign_key: true |


### Association
- has_one :purchase_record


## purchase_record table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase