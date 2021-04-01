class Chart < ApplicationRecord

  validates :chart_date, presence: true

  with_options numericality: true do
    validates :weight
    validates :calorie
    validates :protein,        allow_blank: true
    validates :lipid,          allow_blank: true
    validates :carbohydorate,  allow_blank: true
    validates :vitamin_B1,     allow_blank: true
    validates :vitamin_B2,     allow_blank: true
    validates :vitamin_B6,     allow_blank: true
    validates :vitamin_C,      allow_blank: true
    validates :vitamin_D,      allow_blank: true
  end

  belongs_to :user
end
