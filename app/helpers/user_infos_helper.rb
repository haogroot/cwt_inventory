module UserInfosHelper

  

  def gravatar_for(user_info)
    gravatar_id = Digest::MD5::hexdigest(user_info.Email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user_info.Name, class: "gravatar")
  end
end
