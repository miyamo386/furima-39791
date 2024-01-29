class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token ,:order_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :city
    validates :block
    validates :phone_number, numericality: { only_integer: true }, length: { in: 10..11, message: "Enter between 10 and 11 digits"}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order_id)
  end
end