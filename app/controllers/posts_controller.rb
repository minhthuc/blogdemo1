class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by_time.page(params[:page]).
      per Settings.post.perpage
  end
end
