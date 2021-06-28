FactoryBot.define do
  factory :record_address do
    post_code                     { '123-4567' }
    prefecture_id                 { 2 }
    municipalities                { '米子市昭和町' }
    address                       { '333' }
    building                      { "コーポ" }
    phone_number                  { '09033334444' }
    token                         { 'tok_abcdefghijk00000000000000000' }
  end
end
