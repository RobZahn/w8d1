class SubsController < ApplicationController

    before_action :require_signed_in?, only: [:new, :create, :update, :destroy]
    
    def index 
        @subs = Sub.all 
        render :index
    end

    def show 
        @sub = Sub.find(params[:id])
        render :show
    end

    def new 
        @sub = Sub.new
        render :new
    end

    def create 
        @sub = Sub.create(sub_params)

        if @sub.save 
            redirect_to sub_url
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end
    
    def edit 
        @sub = Sub.find(params[:id])
        render :edit
    end


    def update 
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url
        else 
            flash.now[:errors] = @sub.errors.full_message 
            render :edit 
        end
    end

    # def destroy

    # end

    private 
    def sub_params 
        params.require(:sub).permit(:title, :description)
    end
    
end
