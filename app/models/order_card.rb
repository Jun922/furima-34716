class OrderCard
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :address
    validates :phone_number,  format: {with: /\A\d{10,11}\z/, message: "is only 10 or 11 integer"}, length: { maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    buying = Buying.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buying_id: buying.id)
  end
end