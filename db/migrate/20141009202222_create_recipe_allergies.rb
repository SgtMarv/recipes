class CreateRecipeAllergies < ActiveRecord::Migration
  def change
    create_table :recipe_allergies do |t|

      t.timestamps
    end
  end
end
