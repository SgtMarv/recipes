class CreateIngAllergies < ActiveRecord::Migration
  def change
    create_table :ing_allergies do |t|

      t.timestamps
    end
  end
end
