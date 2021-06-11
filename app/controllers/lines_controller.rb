class LinesController < ApplicationController
before_action :set_params, only: [:show, :edit, :update, :destroy]

  def create
    @line = Line.new(line_params)
    @line.user_id = current_user.id
    if @line.save
      redirect_to lines_path
    else
      @lines = Line.all
      render :index
    end
  end

  def index
    @lines = Line.all
    @line = Line.new()
  end

  def show
    @comment = Comment.new()
    #@comments = Comment.all
    @new_story = Story.new
    @stories = @line.stories
    @first_stories = @stories.where(story_id: nil)
  end

  def edit
  end

  def update
    if @line.update(line_params)
      redirect_to lines_path
    else
      render :edit
    end
  end

  def destroy
    if @line.destroy
      redirect_to lines_path
    else
      render :edit
    end
  end

  protected
  def line_params
    params.require(:line).permit(:content, :book_title)
  end

  def set_params
    @line = Line.find(params[:id])
  end
end
