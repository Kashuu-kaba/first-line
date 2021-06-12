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
    #story._new.html.erbでhiddenを使いstory_idを送っているはず
    if @new_story.save
      redirect_to request.referer, notice: "Story is created successfully!"
    else
      @story = Story.find_by(line_id: @line.id, id: story_params[:story_id])
      if @new_story.story_id #2つ目以降のstory
        #if Story.where(story_id: @story.id)
          @stories = Story.where(story_id: @story.id)
        #else
        #  @stories = @line.stories.where.not(id: nil)
        #end
        render :show
      else #１つ目のstory
        @stories = @line.stories
        @first_stories = @stories.where(story_id: nil)
        @comment = Comment.new()
        render  template: 'lines/show'
      end
    end
  end

  def edit
    @line = Line.find(params[:line_id])
    @story = Story.find_by(line_id: @line.id, id: params[:id])
  end

  def update
    @line = Line.find(params[:line_id])
    @story = Story.find_by(line_id: @line.id, id: params[:id])
    if @story.update(update_params)
      redirect_to line_story_path(@line, @story), notice: "Story is updated successfully!"
    else
      render :edit
    end
  end

  def destroy #これをするならdependent: :destroyを考えないといけない
  end

  protected
  def story_params
    params.require(:story).permit(:user_id, :story_id, :story_comment)
    #params.require(:story).permit(:story_comment, :line_id).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:story).permit(:story_comment)
  end


end
