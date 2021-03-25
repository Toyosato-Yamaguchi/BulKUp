class CreateCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :charts do |t|
      t.date        :chart_date
      t.integer     :weight
      t.integer     :calorie
      t.integer     :protein
      t.integer     :lipid
      t.integer     :carbohydorate
      t.integer     :vitamin_B1
      t.integer     :vitamin_B2
      t.integer     :vitamin_B6
      t.integer     :vitamin_D
      t.integer     :vitamin_C
      t.references  :user,          foreign_key: true
      t.timestamps
    end
  end
end
