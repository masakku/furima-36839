class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image
  has_one :order

  validates :name, presence: true
  validates :info, presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is out of setting range' }
  validates :price, presence: true, numericality: { message: 'is invalid. Input half-width characters' }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shopping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
end
