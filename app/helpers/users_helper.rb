module UsersHelper
    #返回指定用户的Gravatar
    def gravatar_for(user)
        gravatar_id=Digest::MD5::hexdigest(user.email.downcase) #将对象邮箱转小写再生产哈希值
        gravatar_url="https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar") #返回的img标签
    end
end
