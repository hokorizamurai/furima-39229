class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street_address, :telephone_number, :building_name, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :street_address, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number,format: {with:/\A[0-9]{11}\z/,message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create( purchase_record_id: purchase_record.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, telephone_number: telephone_number)
  end
end