FactoryBot.define do
  factory :order_address do
    postal_code                    { '123-4567' }
    prefecture_id                  { 4 }
    city                           { '東京都' }
    house_number                   { '2-2' }
    building                       { '新宿ハイツ' }
    phone_number                   { 12_345_678_901 }
    token                          { 'tok_abcdefghijk00000000000000000' }
  end
end
