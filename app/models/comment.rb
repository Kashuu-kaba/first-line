class Comment < ApplicationRecord
  belongs_to :line
  belongs_to :user

  validates :line_comment, presence: true, length: {maximum: 100}
end
