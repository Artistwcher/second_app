class User < ApplicationRecord
    attr_accessor :remember_token
    
    #name不可为空等验证,不区分大小写
    before_save{self.email=email.downcase} #在存数据前预处理，存邮箱的小写形式
    validates :name, presence:true, length:{maximum:50} 
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence:true, length:{maximum:255}, 
            format:{with:VALID_EMAIL_REGEX},
            uniqueness:{case_sensitive:false}
    
    has_secure_password #调用这个hash函数存密码
    validates :password, presence: true, length: {minimum:6} #password为虚拟属性，只存在与对象里
    #返回字符串的哈希摘要
    def User.digest(string)
        cost=ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string,cost: cost)
    end
    #返回一个随机令牌
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    #在DB中存储cookie摘要
    def remember
        self.remember_token=User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    #如果令牌与摘要匹配则返回true
    def authenticate?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    #忘记用户
    def forget
        update_attribute(:remember_digest,nil)
    end
end
