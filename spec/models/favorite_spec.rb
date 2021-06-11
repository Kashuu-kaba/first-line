require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'バリデーションのテスト' do

    let!(:user) { create(:user) }
    let!(:line) { create(:line, user_id: user.id) }
    let!(:favorite) { create(:favorite, line: line, user: user)}
    let!(:favorite2) { build(:favorite, line: line, user: user)}

    context '１人が１つの投稿に２つ以上いいねできない' do
      it '失敗する' do
        favorite2.valid?
        expect(favorite2).not_to be_valid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
      expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Lineモデルとの関係' do
      it 'N:1となっている' do
      expect(Favorite.reflect_on_association(:line).macro).to eq :belongs_to
      end
    end
  end
  
end