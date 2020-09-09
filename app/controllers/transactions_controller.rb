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
