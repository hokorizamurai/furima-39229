## usersテーブル
|Column            |Type   |Options                |
|------------------|-------|-----------------------|
|last_name         |string |null:false             |
|first_name        |string |null:false             |
|last_name_kana    |string |null:false             |
|first_name_kana   |string |null:false             |
|date_of_birth     |date   |null:false             |
|nickname          |string |null:false             |  
|encrypted_password|string |null:false             |
|email             |string |null:false, unique:true|

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
|prefecture_id     |integer   |null:false                  |
|days_to_ship_id   |integer   |null:false                  |

### Association
belong_to: user
has_one: purchase_record


## purchase_recordsテーブル
|Column|Type      |Options                     |
|------|----------|----------------------------|
|item  |references|null:false, foreign_key:true|
|user  |references|null:false, foreign_key:true|

### Association
belong_to: user
has_one: shipping_address
belong_to: item

## shipping_addressesテーブル
|Column           |Type      |Options                     |
|-----------------|----------|----------------------------|
|purchase_record  |references|null:false, foreign_key:true|
|shipping         |string    |null:false                  |
|prefecture_id    |integer   |null:false                  |
|municipalities   |string    |null:false                  |
|street_address   |string    |null:false                  |
|building_name    |string    |                            |
|telephone_number |string    |null:false                  |

### Association
belong_to: purchase_record