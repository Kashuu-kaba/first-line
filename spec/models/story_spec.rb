require 'rails_helper'

RSpec.describe Story, type: :model do
  describe 'バリデーションのテスト' do

    let!(:user) { create(:user) }
    let!(:line) { create(:line, user_id: user.id) }
    let!(:story) {build(:story, line: line, user: user)}

    context 'story_commentカラムに関して' do
      it 'story登録が成功すること' do
        story.valid?
        expect(story).to be_valid
      end
      it '空欄で失敗する' do
        story.story_comment = ""
        story.valid?
        expect(story.errors[:story_comment]).to include("can't be blank")
      end
      it '2文字以上であること: 1文字は✖️' do
        story.story_comment = Faker::Lorem.characters(number: 1)
        expect(story).not_to be_valid
      end
      it '2文字以上であること: 2文字は○' do
        story.story_comment = Faker::Lorem.characters(number: 2)
        expect(story).to be_valid
      end
      it '200文字以下であること: 201文字は✖️' do
        story.story_comment = Faker::Lorem.characters(number: 201)
        expect(story).not_to be_valid
      end
      it '200文字以下であること: 200文字は○' do
        story.story_comment = Faker::Lorem.characters(number: 200)
        expect(story).to be_valid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Story.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Lineモデルとの関係' do
      it 'N:1となっている' do
        expect(Story.reflect_on_association(:line).macro).to eq :belongs_to
      end
    end
  end
end