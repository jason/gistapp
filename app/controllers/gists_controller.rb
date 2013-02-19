class GistsController < ApplicationController
  def new
    @gist = Gist.new
    3.times { @gist.files.build }
  end

  def create
    @gist = current_user.gists.new(params[:gist])
    if @gist.save!
      redirect_to @gist
    else
      render 'new'
    end
  end

  def show
    @gist = Gist.find(params[:id])
    @favorited = Favorite.favorited?(current_user.id, @gist.id)
  end

  def index
    if current_user
      @gists = Gist.where(user_id: current_user.id)
    else
      redirect_to login_path
    end
  end
end
