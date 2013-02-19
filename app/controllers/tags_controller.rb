class TagsController < ApplicationController
  def index
    @tags = Tag.all

    respond_to do |format|
      format.html { render nothing: true }
      format.json { render json: @tags }
    end
  end
end
