module ApplicationHelper
    def gravatar_for(user, options = {size: 20})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKnfu_5eLxuXXGpbJ59kwET3mMo1Lzn28-8A&usqp=CAU&s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
end
