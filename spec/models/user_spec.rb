require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do

    let!(:user) { create(:user) }
    let!(:other_user) { create(:user)}
    
    context '成功する場合' do
      it 'user登録が成功すること' do
        user.valid?
        expect(user).to be_valid
      end
    end

    context 'nameカラムに関して' do
      it '空欄で失敗する' do
        user.name = ""
        #expect(user).not_to be_valid
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
      it '20文字以下であること: 21文字は✖️' do
        user.name = Faker::Lorem.characters(number: 21)
        expect(user).not_to be_valid
      end
      it '20文字以下であること: 20文字は✖○' do
        user.name = Faker::Lorem.characters(number: 20)
        expect(user).to be_valid
      end
    end

    context 'emailカラムに関して' do
      it '空欄で失敗する' do
        user.email = ""
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Lineモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:lines).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Storyモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:stories).macro).to eq :has_many
      end
    end
  end
end