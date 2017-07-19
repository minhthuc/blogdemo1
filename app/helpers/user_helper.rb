module UserHelper
  def load_value_form resource
    if resource.pending_reconfirmation?
      resource.unconfirmed_email
    else
      resource.email
    end
  end
end
