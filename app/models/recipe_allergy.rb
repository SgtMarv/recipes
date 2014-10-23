class RecipeAllergy < ActiveRecord::Base
    set_table_name "recipe_allergy"
    set_primary_key :id
    attr_accessible :recipe, :allergy
end
