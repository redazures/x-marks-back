class CurrenciesController < ApplicationController

    def index
        currency = Currency.all
        render json: currency
    end

    # def show
    #     currency = Currency.all
    #     render json: currency
    # end
end
