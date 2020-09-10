class CurrenciesController < ApplicationController

    def index
        currency = Currency.all
        render json: currency
    end

    def show
        currency=Currency.find_by(id: params[:id])
        if currency
            # render json: member.to_json(include: [:transactions, :currencies])
            render json: currency.to_json
          else
            render json: { message: 'member not found' }
        end
    end

    def update
        currency=Currency.find_by(id: params[:id])
        currency=Currency.update(currency_params)
        render json: currency
    end

    # def show
    #     currency = Currency.all
    #     render json: currency
    # end
    def currency_params
        params.require(:currency).permit(:price,:symbol,:name)
    end
end

    has_many :transactions
    has_many :members, through: :transactions
    validates :name, uniqueness: true
    validates :symbol, uniqueness: true
-------------------------------------------------------------------
    class TransactionsController < ApplicationController
   def index
      transactions = Transaction.all
      render json: transactions, except: [:created_at, :updated_at]
   end

   def create
      transaction=Transaction.create!(transaction_params)
      render json: transaction
   end

   def transaction_params
      params.require(:transaction).permit(:price,:member_id,:currency_id,:serial,:quantity)
   end

end

class Transaction < ApplicationRecord
   belongs_to :member
   belongs_to :currency
end