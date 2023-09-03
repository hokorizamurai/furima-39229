class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
                  format: { with: /\A[0-9]+\z/ }

  validates :item_name, :description, :price, presence: true

  validates :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
