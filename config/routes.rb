Rails.application.routes.draw do
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Users
  devise_scope :user do
    get "/log-in", to: "devise/sessions#new", as: 'log_in' # custom path to login/sign_in
    get "/sign-up", to: "devise/registrations#new", as: "sign_up" # custom path to sign_up/registration
  end
  devise_for :users

  get '/schedule', to: 'schedule#index'
end
