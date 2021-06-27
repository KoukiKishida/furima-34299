FactoryBot.define do
  factory :product do
    product_name { 'テスト' }
    description { 'テストです！' }
    category_id                   { 2 }
    status_id                     { 2 }
    burden_id                     { 2 }
    prefecture_id                { 2 }
    day_id                        { 2 }
    price                         { 1000 }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.JPG'), filename: 'test.JPG')
    end
    association :user
  end
end
