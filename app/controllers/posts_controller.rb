class PostsController < ApplicationController
  before_action :user_signed?, except: :index
  before_action :correct_user, only: [:edit, :destroy, :update]
  before_action :set_post, only: :show
  
  def index
    @posts = Post.all.sort_by_time.page(params[:page]).
      per Settings.post.perpage
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build post_params
    respond_to do |format|
      if @post.save
        format.html {redirect_to @post, notice: t("devise.post.post_created") }
        format.json {render :show, status: :created, location: @post}
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update post_params
        format.html {redirect_to @post, notice: t("devise.post.post_updated")}
        format.json {render :show, status: :ok, location: @post}
      else
        format.html {render :edit}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to posts_url, notice: t("devise.post.post_destroy")}
      format.json {head :no_content}
    end
  end

  private
  def set_post
    @post = Post.find_by id: params[:id]
  end

  def post_params
    params.require(:post).permit :title, :content, :picture, :tag_list
  end

  def user_signed?
    redirect_to new_user_session_path unless user_signed_in?
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]
  end
end
