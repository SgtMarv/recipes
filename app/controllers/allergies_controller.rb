class AllergiesController < ApplicationController
    before_filter do 
        @title = "Allergies"
        @allergies = Allergy.order(:name).all
    end

    def index

    end


    def show
        @a = Allergy.find(params[:id])
    end


    def new
        @a = Allergy.new
        @action = "Create"
    end
    

    def create
        @a = Allergy.new(params[:allergy])

        @a.save
        
        respond_to do |f|
            f.html{redirect_to(@a)}
        end
    end


    def edit
        @a = Allergy.find(params[:id])
        @action = "Update"
    end


    def update 
        @a = Allergy.find(params[:id])
        @a.update_attributes(params[:allergy])

        respond_to do |f|
            f.html{redirect_to(@a)}
        end
    end


    def destroy
        @a = Allergy.find(params[:id])
        @a.destroy

        respond_to do |f|
            f.html{redirect_to(allergies_path)}
        end
    end
end
