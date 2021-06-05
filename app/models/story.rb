class Story < ApplicationRecord
  belongs_to :line
  belongs_to :user

  validates :story_comment, presence: true, length: {minimum: 2, maximum: 200}

  def parent_story(resource)
    Story.find(resource)
  end
end
