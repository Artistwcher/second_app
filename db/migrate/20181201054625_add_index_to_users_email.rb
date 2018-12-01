class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
    #为email建立索引
    add_index :users, :email, unique: true
  end
end
