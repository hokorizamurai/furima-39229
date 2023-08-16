## usersテーブル
|Column            |Type   |Options   |
|------------------|-------|----------|
|name              |string |null:false|
|name_kana         |string |null:false|
|date_of_birth_id  |integer|
|nickname          |string |null:false|
|encrypted_password|string |null:false|
|email             |string |null:false|

### Association
has_many: items
has_many: purchase_records

## itemsテーブル
|Column            |Type      |Options                     |
|------------------|----------|----------------------------|
|item_name         |string    |null:false                  |
|description       |text      |null:false                  |
|user              |references|null:false, foreign_key:true|
|price             |integer   |null:false                  |
|category_id       |integer   |null:false                  |
|condition_id      |integer   |null:false                  |
|shipping_charge_id|integer   |null:false                  |
|shipping_area_id  |integer   |null:false                  |
|days_to_ship_id   |integer   |null:false                  |

### Association
belong_to: users
has_one: purchase_records


## purchase_recordsテーブル
|Column        |Type      |Options                     |
|--------------|----------|----------------------------|
|item_id       |references|null:false, foreign_key:true|
|user_id       |references|null:false, foreign_key:true|

### Association
belong_to: users
has_one: shipping_addresses
belong_to: items

## shipping_addressesテーブル
|Column           |Type      |Options                     |
|-----------------|----------|----------------------------|
|user_id          |references|null:false, foreign_key:true|
|shipping         |string    |null:false                  |
|prefectures_id   |integer   |null:false                  |
|municipalities   |string    |null:false                  |
|street_address   |string    |null:false                  |
|building_name    |string    |                            |
|telephone_number |string    |null:false                  |

### Association
belong_to: purchase_records