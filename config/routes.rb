Kabuderby::Application.routes.draw do
  get "toppage/index"
  match'/signin', to:'sessions#new', via:'get'
  match'/signout', to:'sessions#destroy',via:'delete'
  root  'about#index'
  match '/about', to:'about#index', via:'get'
  get "/tutorial/select"
  get "/tutorial/buy/:id", to: "tutorial#buy", as: 'tutorial_buy'
  post "/tutorial/confirm/:id", to: "tutorial#confirm", as: 'tutorial_confirm'
  post "/tutorial/complete/:id", to: "tutorial#complete", as: 'tutorial_complete'
  get "toppage/mypage"
  get "/tutorial/select_sell"
  get "/tutorial/sell/:id", to: "tutorial#sell", as: 'tutorial_sell'
  post "/tutorial/sell_confirm/:id", to: "tutorial#sell_confirm", as: 'tutorial_sell_confirm'
  post "/tutorial/sell_complete/:id", to: "tutorial#sell_complete", as: 'tutorial_sell_complete'
  get "/toppage/rank"
  get "/toppage/order"
  get "/toppage/lesson"
  get "/trial/select"
  get "/trial/buy/:id", to: "trial#buy", as: 'trial_buy'
  post "/trial/confirm/:id", to: "trial#confirm", as: 'trial_confirm'
  post "/trial/complete/:id", to: "trial#complete", as: 'trial_complete'
  get "/trial/select_sell/:id", to: "trial#select_sell", as: 'trial_select_sell'
  get "/trial/sell/:id", to: "trial#sell", as: 'trial_sell'
  post "/trial/sell_confirm/:id", to: "trial#sell_confirm", as: 'trial_sell_confirm'
  post "/trial/sell_complete/:id", to: "trial#sell_complete", as: 'trial_sell_complete'
  get "/trial/order/:id", to: "trial#order", as: 'trial_order'
  get "/about/sample"



  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end