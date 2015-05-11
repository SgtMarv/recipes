class IngredientsController < ApplicationController

    before_filter do 
        @title = "Ingredients"
        @ingredients = Ingredient.order(:name).all
    end

    def index
        if params[:view] == "alphabet"
            @view = "alphabet"
            @ingredients = Ingredient.order(:name).all
            unless params[:letter].blank?
                @ingredients.keep_if{|ing| ing.name[0].downcase == params[:letter].downcase}
            end

        else
            @view = "categories"
            @cats = Category.order(:niceness).all
            @ingredients = Array.new
            @cats.each do |cat|
                ings = Ingredient.where("category = ?", cat.id).order(:name)
                @ingredients << ings
            end

        end

    end

    def show
        @i = Ingredient.find(params[:id])
        @cat = Category.find(@i.category)
        @u = Unit.find(@i.favored_unit)
        @als = Allergy.find_by_sql("SELECT *
                                    FROM allergies 
                                    WHERE id IN (SELECT allergy
                                                 FROM ingredient_allergy
                                                 WHERE ingredient = #{@i.id})")
        @convs = Conversion.where(ingredient: @i.id)

    end

    def new
        @i = Ingredient.new
        @units = Unit.order(:name).all
        @cats = Category.order(:name).all
        @als = Allergy.order(:name).all
        @als_sel = @als
        @u=@units.first
        @c=@cats.first
        @action = "Create"
    end

    def create
        @i = Ingredient.new(params[:ingredient]) 
        @i.save

        unless params[:allergies].blank? 
            params[:allergies].each do |a|
                @ia = IngAllergy.new
                @ia.ingredient = @i.id
                @ia.allergy=a
                @ia.save
            end
        end

        respond_to do |f|
            f.html{redirect_to(@i)}
        end
    end

    def edit
        @i = Ingredient.find(params[:id])
        @units = Unit.order(:name).all
        @cats = Category.order(:name).all
        @c = Category.find(@i.category)
        @u = Unit.find(@i.favored_unit)
        @als = Allergy.order(:name).all
        @als_sel = Allergy.find_by_sql("SELECT *
                                        FROM allergies 
                                        WHERE id IN (SELECT allergy
                                                     FROM ingredient_allergy
                                                     WHERE ingredient = #{@i.id})")
        @action = "Update"
    end

    def update
        @i = Ingredient.find(params[:id])
        @i.update_attributes(params[:ingredient])

        @ia = IngAllergy.find_by_sql("SELECT * 
                                      FROM ingredient_allergy 
                                      WHERE ingredient = #{@i.id}")
        @ia.each do |ia|
            ia.destroy
        end

        unless params[:allergies].blank? 
            params[:allergies].each do |a|
                @ia = IngAllergy.new
                @ia.ingredient = @i.id
                @ia.allergy=a
                @ia.save
            end
        end

        respond_to do |f|
            f.html{redirect_to(@i)}
        end
    end

    
    def destroy
        @i = Ingredient.find(params[:id])
        @ia = IngAllergy.find_by_sql("SELECT * 
                                      FROM ingredient_allergy 
                                      WHERE ingredient = #{@i.id}")
        @ia.each do |ia|
            ia.destroy
        end

        @i.destroy
        respond_to do |f|
            f.html{redirect_to(ingredients_path)}
        end
    end

    
    def new_conversion
        @i = Ingredient.find(params[:id])
        @us = Unit.order(:name).all
        @action ="Create"
    end


    def create_conversion
        @i = Ingredient.find(params[:id])
        @conv = Conversion.new
        @conv.ingredient = @i.id
        @conv.unit1 = params[:u1]
        @conv.unit2 = params[:u2]
        @conv.factor = params[:factor]
        @conv.save
    
        respond_to do |f|
            f.html{redirect_to(@i)}
        end
    end


    def edit_conversion
        @c = Conversion.find(params[:id])
        @action = "Update"
    end


    def update_conversion
        @c = Conversion.find(params[:id])
        @c.update_attributes(:factor => params[:factor])
        @i = Ingredient.find(@c.ingredient)
        respond_to do |f|
            f.html{redirect_to(@i)}
        end
    end


    def destroy_conversion
        @conv = Conversion.find(params[:id])
        @i = Ingredient.find(@conv.ingredient)
        @conv.destroy

        respond_to do |f|
            f.html{redirect_to(@i)}
        end
    end

end
