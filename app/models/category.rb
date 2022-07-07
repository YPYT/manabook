class Category < ApplicationRecord
    has_one :listing, dependent: :destroy
end
