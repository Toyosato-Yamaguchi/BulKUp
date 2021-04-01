require 'rails_helper'

RSpec.describe Chart, type: :model do
  describe '摂取栄養素管理機能' do
    before do
      @chart = FactoryBot.build(:chart)
    end
    
    context '摂取栄養素が登録できるとき' do
      it '日付、体重、カロリー、タンパク質、脂質、炭水化物、ビタミンB1、ビタミンB2、ビタミンB6、ビタミンD、ビタミンCが必須であること' do
        
      end
    end

    context '摂取栄養素が登録できないとき' do
      it '日付が空だと登録できない' do
      end
      it '体重が空だと登録できない' do
      end
      it '体重が半角数字以外だと登録できない' do
      end
      it 'カロリーが空だと登録できない' do
      end
      it 'カロリーが半角数字以外だと登録できない' do
      end
      it 'タンパク質が空だと登録できない' do
      end
      it 'タンパク質が半角数字以外だと登録できない' do
      end
      it '炭水化物が空だと登録できない' do
      end
      it '炭水化物が半角数字以外だと登録できない' do
      end
      it '脂質が空だと登録できない' do
      end
      it '脂質が半角数字以外だと登録できない' do
      end
      it 'ビタミンB1が空だと登録できない' do
      end
      it 'ビタミンB1が半角数字以外だと登録できない' do
      end
      it 'ビタミンB2が空だと登録できない' do
      end
      it 'ビタミンB2が半角数字だと登録できない' do
      end
      it 'ビタミンB6が空だと登録できない' do
      end
      it 'ビタミンB6が半角数字だと登録できない' do
      end
      it 'ビタミンDが空だと登録できない' do
      end
      it 'ビタミンDが半角数字以外だと登録できない' do
      end
      it 'ビタミンCが空だと登録できない' do
      end
      it 'ビタミンCが半角数字だと登録できない' do
      end
      it 'ユーザーが紐づいていないと登録できない' do
      end

    end
  end
end
