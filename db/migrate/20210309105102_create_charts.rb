class CreateCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :charts do |t|
      t.date        :chart_date,    null: false
      t.float       :weight,        null: false
      t.float       :calorie,       null: false
      t.float       :protein,       null: false
      t.float       :lipid,         null: false
      t.float       :carbohydorate, null: false
      t.float       :vitamin_B1,    null: false
      t.float       :vitamin_B2,    null: false
      t.float       :vitamin_B6,    null: false
      t.float       :vitamin_D,     null: false
      t.float       :vitamin_C,     null: false
      t.references  :user,          foreign_key: true
      t.timestamps
    end
  end
end
