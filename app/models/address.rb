class Address < ApplicationRecord
  belong_to :order
  belong_to_active_hash :prefecture
end
