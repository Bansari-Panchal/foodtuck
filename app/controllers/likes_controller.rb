class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.likeable_id = params[:likeable_id] 
    @like.likeable_type = params[:likeable_type] 
    @like.user_id = current_user.id
    if Like.where(likeable_id: params[:likeable_id] , likeable_type: params[:likeable_type] , user_id: current_user.id).blank?
      @like.save
    end
  end

  def destroy
    @like = Like.where(likeable_id: params[:likeable_id] , likeable_type: params[:likeable_type] , user_id: current_user.id)
    @like.destroy(@like.ids)
  end
end
