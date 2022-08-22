class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
      redirect_to posts_path, notice: "#{favorite.post.user.name} a inscrit un post en favori"
  end

  def show
        @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "#{favorite.post.user.name} a supprimé son post de la liste des favoris"
  end
end
