class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :line

  validates_uniqueness_of :line_id, scope: :user_id
end
