class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'micropostをお気に入り登録をしました。'
    redirect_to micropost.user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'micropostのお気に入り登録を解除しました。'
    redirect_to micropost.user
  end
end