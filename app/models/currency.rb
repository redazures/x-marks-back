class Currency < ApplicationRecord
    has_many :transactions
    has_many :members, through: :transactions
    validates :name, uniqueness: true
    validates :symbol, uniqueness: true
end
