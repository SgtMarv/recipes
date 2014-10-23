class IngAllergy < ActiveRecord::Base
    set_table_name "ingredient_allergy"
    set_primary_key :id
    attr_accessible :ingredient, :allergy
end
