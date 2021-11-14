## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name_reading       | string              | null: false               |
| birth_day          | string              | null: false               |

### Association

* has_many :items
* belongs_to :purchases

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product name                        | string     | null: false                    |
| product description                 | text       | null: false                    |
| category                            | text       | null: false                    |
| shipping charges                    | string     | null: false                    |
| product condition                   | text    | null: false                    |
| shipping area                       | text     | null: false                    |
| days to ship                        | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## purchases table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| postal_code                         | string     | null: false                    |
| prefecture                          | string     | null: false                    |
| city                                | string     | null: false                    |
| prefecture                          | string     | null: false                    |
| house_number                        | string     | null: false                    |
| building_name                       | string     | null: false                    |
| phone_number                        | string     | null: false                    |
| item                                | references | null: false, foreign_key: true |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item