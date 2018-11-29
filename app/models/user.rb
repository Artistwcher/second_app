class User < ApplicationRecord
    has_many :microposts #一个用户可以有多个微博
    #这边课本出错，一定要写冒号！
    validates :name, presence: true
    #validates :content, presence: true
    validates :email, presence: true
end
