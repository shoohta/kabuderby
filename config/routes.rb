Kabuderby::Application.routes.draw do
  get "toppage/index"
  match'/signin', to:'sessions#new', via:'get'
  match'/signout', to:'sessions#destroy',via:'delete'
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  get "tutorial/select"
  get "/tutorial/buy/:id", to: "tutorial#buy", as: 'tutorial_buy'
  get "/tutorial/confirm/:id", to: "tutorial#confirm", as: 'tutorial_confirm'
  get "toppage/mypage"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end