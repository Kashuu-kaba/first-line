class Story < ApplicationRecord
  belongs_to :line
  belongs_to :user

  validates :story_comment, presence: true, length: {minimum: 2, maximum: 200}

  def parent_story(resource_id)
    Story.find(resource_id)
  end

  def all_parents(parents = [], resource_id)
    pp parent = parent_story(resource_id)

    if parent.story_id.nil?
      #pp "True"
      parents << parent
      #parents << parent.line.content
    else
      #pp "False"
      parents << parent
      all_parents(parents, parent.story_id)
    end
  end

  def child_story(resource_id)
    Story.find(story_id: resource_id)
  end

end