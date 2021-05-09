class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX 
    validates :name_sei, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_mei, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :name_sei_kana, format: { with: /\A[ぁ-んァ-ヶー]+\z/ }
    validates :name_mei_kana, format: { with: /\A[ぁ-んァ-ヶー]+\z/ }
    validates :birthday
  end

  has_many :comments
  has_many :products
  has_many :purchase_records
   
end
