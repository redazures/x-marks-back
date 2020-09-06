class Member < ApplicationRecord
    has_many :transactions
    has_many :currencies, through: :transactions
    validates :email, uniqueness: true
    has_many :credit_cards
end
