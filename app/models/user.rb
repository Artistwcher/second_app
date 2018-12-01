class User < ApplicationRecord
    #name不可为空等验证,不区分大小写
    before_save{self.email=email.downcase} #在存数据前预处理，存邮箱的小写形式
    validates :name, presence:true, length:{maximum:50} 
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence:true, length:{maximum:255}, 
            format:{with:VALID_EMAIL_REGEX},
            uniqueness:{case_sensitive:false}
    
    has_secure_password #调用这个hash函数存密码
    validates :password, presence: true, length: {minimum:6} #password为虚拟属性，只存在与对象里
end
