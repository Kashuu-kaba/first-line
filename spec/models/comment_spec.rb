require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do

    let!(:user) { create(:user) }
    let!(:line) { create(:line, user_id: user.id) }
    let!(:comment) { build(:comment, line: line, user: user) }

    context 'line_commentカラムに関して' do
      it 'comment登録が成功すること' do
        comment.valid?
        expect(comment).to be_valid
      end
      it '空欄で失敗する' do
        comment.line_comment = ""
        comment.valid?
        expect(comment.errors[:line_comment]).to include("can't be blank")
      end
      it '100文字以下であること: 101文字は✖️' do
        comment.line_comment = Faker::Lorem.characters(number: 101)
        expect(comment).not_to be_valid
      end
      it '100文字以下であること: 100文字は○' do
        comment.line_comment = Faker::Lorem.characters(number: 100)
        expect(comment).to be_valid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Lineモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:line).macro).to eq :belongs_to
      end
    end
  end

end