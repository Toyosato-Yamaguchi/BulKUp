class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :user_id, null: false
      t.integer :recipe_id, null: false
      t.timestamps
    end
  end
end
