class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :current_user

  def index
    @posts = Post.all.order("updated_at desc")
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def favorite_list
    @favorites = current_user.favorites
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        PostMailer.post_mail(@post).deliver
        redirect_to letter_opener_web_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  end

  def update
    if @post.user_id == current_user.id 
        if @post.update(post_params)
          redirect_to posts_path, notice: "J'ai modifié le blog !"
        else
          render :edit
        end
    else
        redirect_to posts_path, notice: "Impossible d'afficher cette page !"
    end  
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"J'ai supprimé le post !"
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

end
