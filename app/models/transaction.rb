class Transaction < ApplicationRecord
    belongs_to :currency
    belongs_to :member
end
