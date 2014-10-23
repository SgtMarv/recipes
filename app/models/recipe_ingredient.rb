class RecipeIngredient < ActiveRecord::Base
    set_table_name "recipe_ingredient"
    set_primary_key :id
    attr_accessible :ingredient, :recipe, :amount, :unit
    
  # attr_accessible :title, :body
end
