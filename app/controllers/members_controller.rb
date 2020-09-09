class MembersController < ApplicationController
    def index
        members = Member.all
        render json: members, except: [:created_at, :updated_at]
    end

    def show
        member=Member.find_by(id: params[:id])
        if member
            # render json: member.to_json(include: [:transactions, :currencies])
            render json: member.to_json(:include => {
                :transactions => {:only => [:currency_id,:quantity,:price]},
                :currencies => {:except => [:updated_at]}
            }, :except => [:created_at,:updated_at])
        else
            render json: { message: 'member not found' }
        end
    end

    def create
        member=Member.create!(member_params)
        render json: member
    end

    def member_params
        params.require(:member).permit(:name,:email,:age,:creditcard)
    end
end