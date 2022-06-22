FactoryBot.define do
  factory :listing do
    title { "MyString" }
    list_image { "MyString" }
    price { 1 }
    description { "MyText" }
    condition { 1 }
    sold { false }
    user { nil }
    category { nil }
    comment { nil }
  end
end
