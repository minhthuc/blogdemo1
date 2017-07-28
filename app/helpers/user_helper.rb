module UserHelper
  def load_value_form resource
    if resource.pending_reconfirmation?
      resource.unconfirmed_email
    else
      resource.email
    end
  end

  def gravatar_for user, options = {size: Settings.user.avatar}
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar avatar"
  end
end
