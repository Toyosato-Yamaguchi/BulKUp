class Chart < ApplicationRecord

  validates :chart_date, presence: true

  with_options numericality: true do
    validates :weight
    validates :calorie
    validates :protein
    validates :lipid
    validates :carbohydorate
    validates :vitamin_B1
    validates :vitamin_B2
    validates :vitamin_B6
    validates :vitamin_C
    validates :vitamin_D
  end

  belongs_to :user
end
