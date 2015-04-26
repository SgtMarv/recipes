class RecipesController < ApplicationController

    before_filter do 
        @title = "Recipes"
        @recipes = Recipe.order(:name).all
    end


    def index

    end


    def show
        @r = Recipe.find(params[:id])
        @ings = RecipeIngredient.where("recipe = #{@r.id}")
        @allergies = RecipeAllergy.where("recipe = #{@r.id}")
    end


    def new
        @recipe = Recipe.new
        @action = "Create" 
    end

    
    def check
        @recipe = Recipe.new
        @recipe.name = params[:name]
        @recipe.comment = params[:comment]
        unless params[:image].nil?
            File.open(Rails.root.join('app', 'assets', 'images', params[:image].original_filename), 'wb') do |f|
                f.binmode
                f.write(open(params[:image].tempfile).read)
                f.rewind
            end
            @recipe.image = params[:image].original_filename
        end
            

        @ings = Array.new
        @us   = Array.new
        @vs   = Array.new
        unless params[:ingredient].blank?
            params[:ingredient].each_with_index do |i,j|
                unless i == ""
                    @i = Ingredient.find_by_sql("SELECT *
                                                 FROM ingredients 
                                                 WHERE name = '#{i}'
                                                 ORDER BY name").first
                    unless @i.blank?
                        @ings << @i
                    else
                        @is = Ingredient.find_by_sql("SELECT *
                                                      FROM ingredients 
                                                      ORDER BY name")
                                                      #WHERE name like '#{i}'")
                        @is = @is.keep_if{|x| x.name[0].downcase == i[0].downcase}
                        @ings << [@is,i]

                    end

                    @vs << params[:amount][j]

                    @u = Unit.find_by_sql("SELECT *
                                           FROM units
                                           WHERE name = '#{params[:unit][j]}'").first
                    unless @u.blank?
                        @us << @u
                    else
                        @uus = Ingredient.find_by_sql("SELECT *
                                                       FROM units 
                                                       ORDER BY name")
                                                       
                                                       #WHERE name like '#{i}'")
                        @us << [@uus, params[:unit][j]]
                    end
                end
            end
        end


    end


    def create
        @r = Recipe.new
        @r.name = params[:name]
        @r.comment = params[:comment]
        @r.image = params[:image]
        @r.save 

        unless params[:ingredient].blank?
            params[:ingredient].each_with_index do |ing,i|
                @ri = RecipeIngredient.new
                @ri.recipe = @r.id
                @ri.ingredient = ing
                @ri.amount = params[:amount][i]
                @ri.unit = params[:unit][i]
                @ri.save
            end
        end

        @allergies = Allergy.order(:name).all
        @ings = RecipeIngredient.where("recipe = #{@r.id}")
        @allergies.each do |a|
            ok = true
            @ings.each do |i|
                if ok
                    @ing_a = IngAllergy.find_by_sql("SELECT *
                                                     FROM ingredient_allergy 
                                                     WHERE ingredient = #{i.ingredient}
                                                       AND allergy = #{a.id}")

                    if @ing_a.blank?
                        ok = false
                    end
                end
            end

            if ok
                @rec_a = RecipeAllergy.new
                @rec_a.recipe = @r.id
                @rec_a.allergy = a.id
                @rec_a.save
            end
        end

        respond_to do |f|
            flash[:notice] = "Recipe created"
            f.html{redirect_to(@r)}
        end
    end


    def edit
        @action = "Update" 
        @r = Recipe.find(params[:id])
        @ings = RecipeIngredient.where("recipe = #{@r.id}")
        @units = Unit.order(:name).all
    end


    def update
        @r = Recipe.find(params[:id])
        @r.update_attributes(params[:recipe])

        unless params[:ingredient].blank?
            params[:ingredient].each_with_index do |ing, i|
                @ing = RecipeIngredient.find(ing)
                @ing.update_attributes(:amount => params[:amount][i],
                                       :unit => params[:unit][i])
            end
        end

        @rec_allergies = RecipeAllergy.where("recipe = #{@r.id}")
        @rec_allergies.each do |ra|
            ra.destroy
        end
        
        @allergies = Allergy.order(:name).all
        @ings = RecipeIngredient.where("recipe = #{@r.id}")
        @allergies.each do |a|
            ok = true
            @ings.each do |i|
                if ok
                    @ing_a = IngAllergy.find_by_sql("SELECT *
                                                     FROM ingredient_allergy 
                                                     WHERE ingredient = #{i.ingredient}
                                                       AND allergy = #{a.id}")

                    if @ing_a.blank?
                        ok = false
                    end
                end
            end

            if ok
                @rec_a = RecipeAllergy.new
                @rec_a.recipe = @r.id
                @rec_a.allergy = a.id
                @rec_a.save
            end
        end

        unless params[:image].nil?
            File.open(Rails.root.join('app', 'assets', 'images', params[:image].original_filename), 'wb') do |f|
                f.binmode
                f.write(open(params[:image].tempfile).read)
                f.rewind
            end
            @r.image = params[:image].original_filename
            @r.save
        end

        respond_to do |f|
            flash[:notice] = "Recipe updated"
            f.html{redirect_to(@r)}
        end
    end


    def add_ingredient
        @r = Recipe.find(params[:id])

    end


    def check_ingredient
        @r = Recipe.find(params[:id])
        @ings = Array.new
        @us   = Array.new
        @vs   = Array.new
        unless params[:ingredient].blank?
            params[:ingredient].each_with_index do |i,j|
                unless i == ""
                    @i = Ingredient.find_by_sql("SELECT *
                                                 FROM ingredients 
                                                 WHERE name = '#{i}'").first
                    unless @i.blank?
                        @ings << @i
                    else
                        @is = Ingredient.find_by_sql("SELECT *
                                                      FROM ingredients 
                                                      ORDER BY name")
                                                      #WHERE name like '#{i}'")

                        @is = @is.keep_if{|x| x.name[0].downcase == i[0].downcase}

                        @ings << [@is,i] 
                    end

                    @vs << params[:amount][j]

                    @u = Unit.find_by_sql("SELECT *
                                           FROM units
                                           WHERE name = '#{params[:unit][j]}'").first
                    unless @u.blank?
                        @us << @u
                    else
                        @uus = Ingredient.find_by_sql("SELECT *
                                                      FROM units 
                                                      ORDER BY name")

                                                      #WHERE name like '#{i}'")
                        @us << [@uus,params[:unit][j]]
                    end
                end
            end
        end
    end


    def insert_ingredient
        @r = Recipe.find(params[:id])

        unless params[:ingredient].blank?
            params[:ingredient].each_with_index do |ing,i|
                @ri = RecipeIngredient.new
                @ri.recipe = @r.id
                @ri.ingredient = ing
                @ri.amount = params[:amount][i]
                @ri.unit = params[:unit][i]
                @ri.save
            end
        end

        @rec_allergies = RecipeAllergy.where("recipe = #{@r.id}")
        @rec_allergies.each do |ra|
            ra.destroy
        end
        
        @allergies = Allergy.order(:name).all
        @ings = RecipeIngredient.where("recipe = #{@r.id}")
        @allergies.each do |a|
            ok = true
            @ings.each do |i|
                if ok
                    @ing_a = IngAllergy.find_by_sql("SELECT *
                                                     FROM ingredient_allergy 
                                                     WHERE ingredient = #{i.ingredient}
                                                       AND allergy = #{a.id}")

                    if @ing_a.blank?
                        ok = false
                    end
                end
            end

            if ok
                @rec_a = RecipeAllergy.new
                @rec_a.recipe = @r.id
                @rec_a.allergy = a.id
                @rec_a.save
            end
        end

        respond_to do |f|
            f.html{redirect_to(@r)}
        end
    end


    def remove_ingredient
        @ing = RecipeIngredient.find(params[:id])
        @r = Recipe.find(@ing.recipe)

        @ing.destroy

        respond_to do |f|
            f.html{redirect_to(edit_recipe_url(:id=> @r.id))}
        end
    end


    def delete_image
        @r = Recipe.find(params[:id])

        @r.update_attributes(:image => nil)

        respond_to do |f|
            f.html{redirect_to(edit_recipe_path(:id => @r.id))}
        end


    end


    def destroy
        @r = Recipe.find(params[:id])
        @ings = RecipeIngredient.find_by_sql("SELECT * 
                                              FROM recipe_ingredient
                                              WHERE recipe = #{@r.id}")

        unless @r.image.blank?
            File.delete(Rails.root.join('app', 'assets', 'images', @r.image)) if File.exist?(Rails.root.join('app', 'assets', 'images', @r.image))
        end

        @as = RecipeAllergy.where("recipe = #{@r.id}")
        @as.each do |a|
            a.destroy
        end

        @ings.each do |i|
            i.destroy
        end

        @r.destroy
        respond_to do |f|
            f.html{redirect_to(recipes_path)}
        end
    end 

end
