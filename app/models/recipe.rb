class Recipe < ActiveRecord::Base
    set_table_name "recipes"
    set_primary_key :id
     attr_accessible :name, :comment
end
