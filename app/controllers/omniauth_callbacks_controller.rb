class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth request.env["omniauth.auth"]
    if @user.persisted?
      sign_in_and_redirect user, noice: t("devise.sessions.signed_in")
    else
      redirect_to new_user_registration_url
    end
  end
end
