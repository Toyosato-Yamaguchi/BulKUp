require 'rails_helper'

RSpec.describe Chart, type: :model do
  describe '摂取栄養素管理機能' do
    before do
      @chart = FactoryBot.build(:chart)
    end
    
    context '摂取栄養素が登録できるとき' do
      it '日付、体重、カロリー、タンパク質、脂質、炭水化物、ビタミンB1、ビタミンB2、ビタミンB6、ビタミンD、ビタミンCが必須であること' do
        expect(@chart).to be_valid
      end
    end

    context '摂取栄養素が登録できないとき' do
      it '日付が空だと登録できない' do
        @chart.chart_date = ''
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Chart date can't be blank")
      end
      it '体重が半角英数字以外だと登録できない' do
        @chart.weight = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Weight is not a number")
      end
      it 'カロリーが半角数字以外だと登録できない' do
        @chart.calorie = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Calorie is not a number")
      end
      it 'タンパク質が半角数字以外だと登録できない' do
        @chart.protein = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Protein is not a number")
      end
      it '炭水化物が半角数字以外だと登録できない' do
        @chart.carbohydorate = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Carbohydorate is not a number")
      end
      it '脂質が半角数字以外だと登録できない' do
        @chart.lipid = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Lipid is not a number")
      end
      it 'ビタミンB1が半角数字以外だと登録できない' do
        @chart.vitamin_B1 = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Vitamin b1 is not a number")
      end
      it 'ビタミンB2が半角数字だと登録できない' do
        @chart.vitamin_B2 = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Vitamin b2 is not a number")
      end
      it 'ビタミンB6が半角数字だと登録できない' do
        @chart.vitamin_B6 = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Vitamin b6 is not a number")
      end
      it 'ビタミンDが半角数字以外だと登録できない' do
        @chart.vitamin_D = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Vitamin d is not a number")
      end
      it 'ビタミンCが半角数字だと登録できない' do
        @chart.vitamin_C = '１'
        @chart.valid?
        expect(@chart.errors.full_messages).to include("Vitamin c is not a number")
      end
      it 'ユーザーが紐づいていないと登録できない' do
        @chart.user = nil
        @chart.valid?
        expect(@chart.errors.full_messages).to include("User must exist")
      end

    end
  end
end
