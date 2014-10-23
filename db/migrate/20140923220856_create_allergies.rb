class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|

      t.timestamps
    end
  end
end
