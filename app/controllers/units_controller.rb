class UnitsController < ApplicationController

    before_filter do 
        @title = "Units"
        @units = Unit.order(:name).all
    end

    def index

    end


    def show
        @u = Unit.find(params[:id])
    end


    def new
        @u = Unit.new
        @action = "Create"
    end
    

    def create
        @u = Unit.new(params[:unit])

        @u.save
        
        respond_to do |f|
            f.html{redirect_to(@u)}
        end
    end


    def edit
        @u = Unit.find(params[:id])
        @action = "Update"
    end


    def update 
        @u = Unit.find(params[:id])
        @u.update_attributes(params[:unit])

        respond_to do |f|
            f.html{redirect_to(@u)}
        end
    end


    def destroy
        @u = Unit.find(params[:id])
        @u.destroy

        respond_to do |f|
            f.html{redirect_to(units_path)}
        end
    end

end
