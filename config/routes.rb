Kabuderby::Application.routes.draw do
  get "toppage/index"
  match'/signin', to:'sessions#new', via:'get'
  match'/signout', to:'sessions#destroy',via:'delete'
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  get "/tutorial/select"
  get "/tutorial/buy/:id", to: "tutorial#buy", as: 'tutorial_buy'
  post "/tutorial/confirm/:id", to: "tutorial#confirm", as: 'tutorial_confirm'
  post "/tutorial/complete:id", to: "tutorial#complete", as: 'tutorial_complete'
  get "toppage/mypage"
  get "/tutorial/select_sell"
  get "/tutorial/sell/:id", to: "tutorial#sell", as: 'tutorial_sell'
  post "/tutorial/sell_confirm/:id", to: "tutorial#sell_confirm", as: 'tutorial_sell_confirm'
  #get "/tutorial/sell_complete/"
  get "/toppage/rank"
  get "/toppage/order"
  get "/toppage/lesson"


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end