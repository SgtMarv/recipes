class CategoriesController < ApplicationController

    before_filter do 
        @title = "Categories"
        @categories = Category.order(:niceness).all
    end

    def index

    end


    def show
        @c = Category.find(params[:id])
    end


    def new
        @c = Category.new
        @action = "Create"
    end
    

    def create
        @c = Category.new(params[:category])

        @c.save
        
        respond_to do |f|
            f.html{redirect_to(@c)}
        end
    end


    def edit
        @c = Category.find(params[:id])
        @action = "Update"
    end


    def update 
        @c = Category.find(params[:id])
        @c.update_attributes(params[:category])

        respond_to do |f|
            f.html{redirect_to(@c)}
        end
    end


    def destroy
        @c = Category.find(params[:id])
        @c.destroy

        respond_to do |f|
            f.html{redirect_to(categories_path)}
        end
    end

end
