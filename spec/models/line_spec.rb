require 'rails_helper'

RSpec.describe Line, type: :model do
  describe 'バリデーションのテスト' do
    #subject { line.valid? }

    let!(:user) { create(:user) }
    let!(:other_line) { create(:line, user_id: user.id) }
    let!(:line) { create(:line, user_id: user.id) }

    context 'contentカラムに関して' do
      it 'line登録が成功すること' do
        line.valid?
        expect(line).to be_valid
        #is_expected.to eq true
      end
      it '空欄で失敗する' do
        p = Line.new(
          content: "",
          book_title: "ねこ",
          jenru: 1,
          user_id: line.user_id
          )
          p.valid? # （1）
          expect(p.errors[:content]).to include("can't be blank")
      end
      it 'uniquenessが効く' do
          line.content = other_line.content
        # p = Line.create(
        #   content: "cocoa",
        #   book_title: "cacao",
        #   jenru: 2,
        #   user_id: line.user_id
        #   )
        # z = Line.create(
        #   content: "cocoa",
        #   book_title: "koko",
        #   jenru: 1,
        #   user_id: line.user_id
        #   )
          expect(line).not_to be_valid
          # is_expected.to eq false
      end
      it '2文字以上であること: 1文字は✖️' do
        line.content = Faker::Lorem.characters(number: 1)
        expect(line).not_to be_valid
      end
      it '2文字以上であること: 2文字は○' do
        user.name = Faker::Lorem.characters(number: 2)
        expect(line).to be_valid
      end
      it '200文字以下であること: 201文字は✖️' do
        line.content = Faker::Lorem.characters(number: 201)
        expect(line).not_to be_valid
      end
      it '200文字以下であること: 200文字は○' do
        line.content = Faker::Lorem.characters(number: 200)
        expect(line).to be_valid
      end
      
    end
    context 'book_titleに関して' do
      it 'book_title登録が成功すること' do
        #line.valid? #なくても大丈夫
        expect(line).to be_valid
      end
      it '空欄で失敗すること' do
        line.book_title = ""
        line.valid?
        expect(line.errors[:book_title]).to include("can't be blank")
      end
      it 'uniquenessが効く' do
        line.book_title = other_line.book_title
        expect(line).not_to be_valid
      end
      it '20文字以下: 21文字は✖️' do
        line.book_title = Faker::Lorem.characters(number: 21)
        expect(line).not_to be_valid
      end
      it '20文字以下: 20文字は○' do
        line.book_title = Faker::Lorem.characters(number: 20)
        expect(line).to be_valid
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Line.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Line.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Line.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'Storyモデルとの関係' do
      it '1:Nとなっている' do
        expect(Line.reflect_on_association(:stories).macro).to eq :has_many
      end
    end
  end

end