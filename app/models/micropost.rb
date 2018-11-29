class Micropost < ApplicationRecord
    belongs_to :user #一个微博只属于一个用户
    validates :content, length:{maximum:100} #对内容长豆限制为100以内字符
    validates :content, presence: true
end
