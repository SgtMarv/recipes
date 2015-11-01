class MenusController < ApplicationController
    before_filter do 
        @title = "Menus"
        @menus = Menu.order(:name).all
    end

    def index

    end

    def show
        @m = Menu.find(params[:id])
        @mrs = MenuRecipe.where("menue = #{@m.id}")
        @mrs.sort_by!{|m| Recipe.find(m.recipe).name }
    end

    def new
        @m = Menu.new
        @foo = "foo"
        @action = "Create" 
    end


    def create
        @m = Menu.new(params[:menu])
        @m.created = DateTime.now

        @m.save 

        respond_to do |f|
            f.html{redirect_to(@m)}
        end
    end


    def edit
        @m = Menu.find(params[:id])
        @mrs = MenuRecipe.where("menue = #{@m.id}")
        @action = "Update"
    end

    
    def update 
        @m = Menu.find(params[:id])
        @m.update_attributes(params[:menu])
        
        unless params[:factor].blank?
            params[:recipe].each_with_index do |r,i|
                @mr = MenuRecipe.find(r)
                @mr.update_attributes(:factor => params[:factor][i])
            end
        end

        redirect_to(@m)
    end


    def add_recipe
        @m= Menu.find(params[:id])
        @recipes = Recipe.order(:name).all
    end


    def insert_recipe
        @m= Menu.find(params[:id])
        @mr = MenuRecipe.new
        @mr.menue = @m.id 
        @mr.recipe = params[:recipe]
        @mr.factor = params[:factor]

        @mr.save


        redirect_to(@m)
    end


    def remove_recipe
        @m = Menu.find(params[:id])
        @mr = MenuRecipe.find(params[:mr])
        @mr.destroy

        redirect_to(edit_menu_path)
    end


    def recipe_list
        @m = Menu.find(params[:id])
        @mrs = MenuRecipe.where("menue = #{@m.id}")

        respond_to do |f|
            f.pdf{render 'recipe_list'}
        end
    end


    def shopping_list
        @m = Menu.find(params[:id])
        @mrs = MenuRecipe.where("menue = #{@m.id}")
        @ingredients = Ingredient.order(:category,:name).all

        @ings = Array.new 

        #    @ings << [i.id, i.name, 0.0, unit.id, unit.name, cat]

        @mrs.each do |mr|
            @r  = Recipe.find(mr.recipe)
            @ri = RecipeIngredient.where("recipe = #{@r.id}")
            @ri.each do |ri|
                @i = Ingredient.find(ri.ingredient)

                if @i.favored_unit == ri.unit   #ing already given in fav unit
                    index = @ings.index{|x| x[0] == @i.id && x[3] == ri.unit}
                    unless index.nil? #ing and unit already in list
                        @ings[index][2] += @m.people.to_f * mr.factor * ri.amount
                    else #ing not in list
                        amount = @m.people.to_f * mr.factor * ri.amount
                        unit = Unit.find(ri.unit)
                        cat = Category.find(@i.category)
                        @ings << [@i.id, @i.name, amount, unit.id, unit.name,cat.name]
                    end
                else #conversion of ing necessary
                    @conv = Conversion.where("ingredient = ? AND unit2 = ? AND unit1 = ?", @i.id, @i.favored_unit, ri.unit).first

                    unless @conv.blank? #conv to favored unit exists
                        index = @ings.index{|x| x[0]==@i.id&&x[3]==@i.favored_unit}
                        unless index.nil? #ing and unit already in list
                            @ings[index][2] += @m.people.to_f * mr.factor * ri.amount * @conv.factor 
                        else #ing not in list
                            amount = @m.people.to_f * mr.factor * ri.amount * @conv.factor
                            unit = Unit.find(@i.favored_unit)
                            cat = Category.find(@i.category)
                            @ings << [@i.id,@i.name,amount,unit.id,unit.name,cat.name]
                        end
                    else # no conversion
                        index = @ings.index{|x| x[0]==@i.id&&x[3]==ri.unit}
                        unless index.nil? #ing and unit already in list
                            @ings[index][2] += @m.people.to_f * mr.factor * ri.amount 
                        else #ing not in list
                            amount = @m.people.to_f*mr.factor*ri.amount
                            unit = Unit.find(ri.unit)
                            cat = Category.find(@i.category)
                            @ings << [@i.id,@i.name,amount,unit.id,unit.name,cat.name]
                        end
                    end
                end
            end
        end

        @ings = @ings.sort_by{|a| [a[5],a[1]] }

        respond_to do |f|
            f.pdf{render 'shopping_list'}
        end
    end


    def destroy
        @m = Menu.find(params[:id])
        @mrs = MenuRecipe.where("menue = #{@m.id}")

        @mrs. each do |mr|
            mr.destroy
        end

        @m.destroy

        redirect_to(menus_path)
    end
end
