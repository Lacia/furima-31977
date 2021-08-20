FactoryBot.define do
  factory :user do
    nickname {"Lacia"}
    email {"Lacia@gmail.com"}
    password {"000000"}
    encryptable_password {"000000"}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birth_day {"1999-05-14"}
  end
end