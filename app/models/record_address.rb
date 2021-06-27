class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :product_id, :user_id, :token

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    purchase_record = PurchaseRecord.create(product_id: product_id, user_id: user_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_record: purchase_record)
  end
end