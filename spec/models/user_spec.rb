require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できる時' do
      it 'nickname、email、password、password_confirmation、性別、身長、体重、生年月日が必須であること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠がないと登録できない' do
        @user.nickname = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが英数字混合していても5文字以下では登録できない' do
        @user.password = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'paswordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみの場合は登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが一致していない場合は登録できないこと' do
        @user.password = '111aaa'
        @user.password_confirmation = 'aaa111'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it '性別が体と登録できない' do
        @user.gender = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender can't be blank")
      end
      it '身長が空だと登録できない' do
        @user.body_height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Body height can't be blank")
      end
      it '身長が半角数字以外だと登録できない' do
        @user.body_height = "１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Body height is not a number")
      end
      it '体重が体と登録できない' do
        @user.body_weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Body weight can't be blank")
      end
      it '体重が半角英数字以外だと登録できない' do
        @user.body_weight = "１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Body weight is not a number")
      end
      it '誕生日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
