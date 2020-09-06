class TransactionsController < ApplicationController
    def index
        txn = Transaction.all
        render json: txn
    end
end
