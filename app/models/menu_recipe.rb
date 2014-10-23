class MenuRecipe < ActiveRecord::Base
    set_table_name "menue_recipe"
    set_primary_key :id
    attr_accessible :menue, :recpie, :factor
end
