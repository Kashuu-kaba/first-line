class FavoritesController < ApplicationController

  def create
    line = Line.find(params[:line_id])
    favorite = current_user.favorites.new(line_id: line.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    line = Line.find(params[:line_id])
    favorite = current_user.favorites.find_by(line_id: line.id)
    favorite.destroy
    redirect_to request.referer
  end

end
