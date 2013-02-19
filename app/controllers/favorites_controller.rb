class FavoritesController < ApplicationController
  def create
    Favorite.create!(user_id: current_user.id,
                     gist_id: params[:gist_id])

    render nothing: true
  end

  def destroy
    Favorite.where("user_id = ? AND gist_id = ?",
                    current_user.id,
                    params[:gist_id]).first.destroy

    render nothing: true
  end

end
