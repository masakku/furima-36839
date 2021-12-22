FactoryBot.define do
  factory :user do
    nickname                   { 'furima' }
    email                      { 'furima@gmail' }
    password                   { 'aaa000' }
    password_confirmation      { password }
    first_name                 { '山田' }
    last_name                  { '太郎' }
    first_name_kana            { 'ヤマダ' }
    last_name_kana             { 'タロウ' }
    birth_data                 { '1999-02-02' }
  end
end
