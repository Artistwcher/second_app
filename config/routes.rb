Rails.application.routes.draw do
  get 'static_pages/home'#脚手架新生成的，get表明，这个路由响应的是GET请求
  #GET表示读取一个网页
  get 'static_pages/help'
  get 'static_pages/about'
  
  resources :microposts
  resources :users #加入这个控制器里所有URL？
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  #root 'users#index'
  root 'static_pages#home'
end
