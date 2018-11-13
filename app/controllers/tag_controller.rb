class TagController < ApplicationController
  before_action :set_tag, only: %i(update destroy)
  def create
    @tag = Tag.new(tag_params)

    if @tag.save!
      head 200
    else
      head 422
    end
  end

  def update
    if @tag.update!(tag_params)
      head 200
    else
      head 422
    end
  end

  def destroy
    if @tag.destroy!
      head 200
    else
      head 422
    end
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
