require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "レシピ投稿機能" do
    before do
      @recipe = FactoryBot.build(:recipe)
    end

    context 'レシピ投稿できるとき' do
      it 'レシピ名、レシピ画像、食材、栄養素、作り方、調理時間が必須であること' do
        expect(@recipe).to be_valid
      end
    end

    context 'レシピが投稿できないとき' do
      it 'レシピ名が空だと投稿できない' do
        @recipe.recipe_name = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Recipe name can't be blank")
      end
      it 'レシピ画像が空だと投稿できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Image can't be blank")
      end
      it '材料が空だと投稿できない' do
        @recipe.ingredients = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Ingredients can't be blank")
      end
      it '栄養素が空だと投稿できない' do
        @recipe.nutrition = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Nutrition can't be blank")
      end 
      it '作り方が空だと投稿できない' do
        @recipe.cooking_method = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Cooking method can't be blank")
      end
      it '調理時間が空だと投稿できない' do
        @recipe.cooking_time_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Cooking time must be other than 1")
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @recipe.user = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("User must exist")
      end
    end
  end
end
