class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :burden
  belongs_to :day
  belongs_to :user

  with_options presence: true do
  validates :product_name, :description
  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
  end
  validates :category_id, :status_id, :burden_id, :prefectures_id, :day_id, numericality: { other_than: 1 }
end
