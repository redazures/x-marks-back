class Transaction < ApplicationRecord
    belongs_to :member
    belongs_to :currency
 end