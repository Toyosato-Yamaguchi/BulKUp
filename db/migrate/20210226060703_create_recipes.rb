class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :recipe_name,     null: false
      t.string     :ingredients,     null: false
      t.text       :cooking_method,  null: false
      t.integer    :cooking_time_id, null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
