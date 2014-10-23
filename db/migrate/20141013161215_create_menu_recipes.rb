class CreateMenuRecipes < ActiveRecord::Migration
  def change
    create_table :menu_recipes do |t|

      t.timestamps
    end
  end
end
