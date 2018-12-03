Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new' #给其指定路由名
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  
  resources :microposts
  resources :users #加入这个控制器里所有URL？把数据视为资源
  #get 'static_pages/help'
  #get 'static_pages/about'
  #get 'static_pages/contact'
  #get 'static_pages/home' #GET表示读取一个网页
end
