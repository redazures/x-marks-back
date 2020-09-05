class Member < ApplicationRecord
    has_many :transactions
    has_many :currencies, through: :transactions
    validates :email, uniqueness: true
end
