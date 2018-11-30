Rails.application.routes.draw do
  get 'static_pages/home'#脚手架新生成的，get表明，这个路由响应的是GET请求
  #GET表示读取一个网页

  get 'static_pages/help'

  resources :microposts
  resources :users #
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  root 'users#index'
end
