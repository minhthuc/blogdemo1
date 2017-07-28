module PostHelper
  included "UserHelper"
  def load_user post
    User.find_by id: post.user_id
  end
end
