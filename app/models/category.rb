class Category < ActiveRecord::Base
    set_table_name "categories"
    set_primary_key :id
    attr_accessible :name, :niceness
end
