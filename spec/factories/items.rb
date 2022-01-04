FactoryBot.define do
  factory :item do
    name                         { 'hoge' }
    info                         { 'aaaa' }
    category_id                  { '2' }
    sales_status_id              { '3' }
    shopping_fee_status_id       { '2' }
    prefecture_id                { '4' }
    scheduled_delivery_id        { '3' }
    price                        { '11111' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end

    factory :item_no_image, class: Item do
      name                          { 'hoge' }
      info                          { 'aaaa' }
      category_id                   { '2' }
      sales_status_id               { '3' }
      shopping_fee_status_id        { '2' }
      prefecture_id                 { '3' }
      scheduled_delivery_id         { '2' }
      price                         { '11111' }
    end
  end
end
