class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :burden
  belongs_to :day

  validates :product_name, :description, presence: true

  validates :category_id, :status_id, :burden_id, :prefectures_id, :day_id, numericality: { other_than: 1 }

  validates :price,presence: true,
  numericality: {only_integer: true,greater_than_or_equal_to: 300,less_than: 9999999 }
end
