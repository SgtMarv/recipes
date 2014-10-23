class Menu < ActiveRecord::Base
    set_table_name "menues"
    set_primary_key :id
    attr_accessible :name, :people, :created
end
