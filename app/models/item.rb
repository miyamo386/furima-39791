class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :delivery_criterion

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :image
  end

  with_options presence: true, format: { with:  /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
      presence: { message: "can't be blank" }
  end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :item_status_id
    validates :delivery_price_id
    validates :prefecture_id
    validates :delivery_criterion_id
  end
end