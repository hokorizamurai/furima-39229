## userテーブル
|Column            |Type  |Options   |
|------------------|------|----------|
|name              |string|null:false|
|encrypted_password|string|null:false|
|e-mail            |string|null:false|

### Association
has_many: items
has_many: purchase_record

## itemsテーブル
|Column         |Type      |Options                     |
|---------------|----------|----------------------------|
|item_name      |string    |null:false                  |
|description    |text      |null:false                  |
|seller         |references|null:false, foreign_key:true|
|price          |integer   |null:false                  |
|category       |string    |null:false                  |
|condition      |string    |null:false                  |
|shipping_charge|string    |null:false                  |
|shipping_area  |string    |null:false                  |
|days_to_ship   |string    |null:false                  |

### Association
belong_to: user
has_one: purchase_record


## purchase_recordテーブル
|Column        |Type      |Options                     |
|--------------|----------|----------------------------|
|purchase      |references|null:false, foreign_key:true|
|buyer         |references|null:false, foreign_key:true|
|payment_method|string    |null:false                  |

### Association
belong_to: user
has_one: shipping

## shippingテーブル
|Column          |Type      |Options                     |
|----------------|----------|----------------------------|
|buyer           |references|null:false, foreign_key:true|
|shipping        |string    |null:false                  |
|prefectures     |string    |null:false                  |
|municipalities  |string    |null:false                  |
|street_address  |string    |null:false                  |
|building_name   |string    |                            |
|telephone_number|integer   |null:false                  |

### Association
belong_to: purchase_record