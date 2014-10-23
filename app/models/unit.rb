class Unit < ActiveRecord::Base
    set_table_name "units"
    set_primary_key :id
    attr_accessible :name 
end
