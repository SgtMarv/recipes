class Ingredient < ActiveRecord::Base
    set_table_name "ingredients"
    set_primary_key :id
    attr_accessible :name, :favored_unit, :category, :comment
end
