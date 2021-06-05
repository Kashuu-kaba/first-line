class Line < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :stories, dependent: :destroy

  enum jenru:{fantasy:0, battle:1, mystery:2, romance:3 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

 validates :content, presence: true, uniqueness: true, length: {minimum: 2, maximum: 200}
 validates :book_title, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
end
