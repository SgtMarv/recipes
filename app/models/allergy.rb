class Allergy < ActiveRecord::Base
    set_table_name "allergies"
    set_primary_key :id
    attr_accessible :name
end
