require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録ができるとき' do
      it '全ての値が正しく入力されていれば登録ができる' do
      end
      it 'aが６文字以上であれば登録ができる' do
      end


    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空だと登録できない' do
      end
      it 'last_nameが空だと登録できない' do
      end
      it 'first_nameが空だと登録できない' do
      end
      it 'last_name_kanaが空だと登録できない' do
      end
      it 'first_name_kanaが空だと登録できない' do
      end
      it 'data_of_birthが空だと登録できない' do
      end
      it 'emailが空だと登録できない' do
      end
      it 'emailは＠を含まないと登録できない' do
      end
      it'重複したemailが存在すると登録できない' do
      end
      it 'passwordが空だと登録できない' do
      end
      it 'password_confirmationが空だと登録できない' do
      end
      it 'passwordが5文字以下であると登録できない' do
      end
      it 'passwordが半角英数混合でないと登録できない' do
      end
      it 'passwordが全角のみである場合は登録できない' do
      end
      it 'passwordが英語のみである場合は登録できない' do
      end
      it 'passwordとpassoword_confirmationが不一致では登録できない' do
      end
    end
  end
end
