class CurrenciesController < ApplicationController

    def index
        currency = Currency.all.sort
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
        currency=currency.update!(currency_params)
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