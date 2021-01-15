FactoryBot.define do
  factory :buy_form do
    post_code             {"123-1234"}
    prefecture_id         {2}
    city                  {"大阪市"}
    house_number          {"大今里1-1-1"}
    phone_number          {"0612341234"}
    token                 {"tok_abcdefghijk00000000000000000"}
    building_name         {"建物名"}
  end
end
