class Line < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stories, dependent: :destroy

  enum jenru:{ミステリー:0, 青春:1, 恋愛:2, SF:3,ファンタジー:4, ホラー:5, コメディ:6, 経済:7, その他:8}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :content, presence: true, uniqueness: true, length: {minimum: 2, maximum: 200}
  validates :book_title, presence: true, uniqueness: true, length: {maximum: 20}
end
