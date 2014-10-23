class Conversion < ActiveRecord::Base
    set_table_name "conversions"
    set_primary_key :id
    attr_accessible :unit1, :unit2, :ingrediant, :factor
  # attr_accessible :title, :body
end
