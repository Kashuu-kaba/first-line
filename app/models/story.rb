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
      parents << parent.story_comment
      #parents << parent.line.content
    else
      parents << parent.story_comment
      all_parents(parents, parent.story_id)
    end

    # parents = []
    # pp parent = parent_story(resource_id)

    # if parent.story_id.nil?
    #   pp "Ture"
    #   parents << parent.line.content
    #   parents << parent.story_comment
    #   #all_parents(parent.story_id)
    # else
    #   pp "False"
    #   pp parents << parent.story_comment
    #   all_parents(parent.story_id)
    # end

  end
end
