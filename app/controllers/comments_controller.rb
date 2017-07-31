class CommentsController < ApplicationController
  before_action :correct_user, only: [:update, :edit, :destroy]
  before_action :load_post, only: [:create, :update, :destroy, :edit]

  def create
    @comment = @post.comments.build comment_param
    if @comment.save
      flash[:success] = t "devise.comment.commented"
      redirect_to @post
    else
      flash[:warning] = t "devise.comment.opp"
      redirect_to @post
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes comment_param
      flash[:success] = t "devise.comment.edited"
      redirect_to @post
    else
      flash[:warning] = t "devise.comment.opp"
      redirect_to root_path
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "devise.comment.deleted"
      redirect_to @post
    else
      flash[:warning] = t "devise.comment.opp"
      redirect_to root_path
    end
  end

  private

  def comment_param
    params.require(:comment).permit :user_id, :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    render "public/404.html" unless @post
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    render "public/404.html" unless @comment
  end
end
