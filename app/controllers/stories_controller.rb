class StoriesController < ApplicationController

  def show
    #@story = Story.find(params[:id])
    #@parent_story = Story.find_by(story_id: params[:story_id])
    #@stories = Story.where(story_id: @story.id)
    @new_story = Story.new
    @line = Line.find(params[:line_id])
    @story = Story.find_by(line_id: @line.id, id: params[:id])
    @stories = Story.where(story_id: @story.id)
  end

  def create
    @line = Line.find(params[:line_id])
    @new_story = @line.stories.new(story_params)
    #story_paramがstory_idを持っているか田舎で条件分岐しようとしていたが保留→story_params[:story_id]
    #story._new.html.erbでhiddenを使いstory_idを送っているはず
    if @new_story.save
       redirect_to request.referer
    else
      if @new_story.story_id == nil
          @stories = @line.stories
          @first_stories = @stories.where(story_id: nil)
          @comment = Comment.new()
          render  template: 'lines/show'
        else
          @story = Story.find_by(line_id: @line.id, id: params[:id])
          @stories = Story.where(story_id: @story.id)
        render :show
        end
    end
  end

  def destroy
    story = Story.find_by(id: params[:id], line_id: params[line_id])
    if story.user.id == current_user.id
      story.destroy
      redirect_to request.referer
    end
  end

  protected
  def story_params
    params.require(:story).permit(:user_id, :story_id, :story_comment)
    #params.require(:story).permit(:story_comment, :line_id).merge(user_id: current_user.id)
  end
end
