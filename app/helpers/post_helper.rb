module PostHelper
  included "UserHelper"
  def load_user post
    User.find_by id: post.user_id
  end

  def correct_user source
    current_user !=nil && current_user.id == source.user_id
  end
end
