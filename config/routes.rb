Rails.application.routes.draw do
  defaults format: :json do
    root to: "home#index"
    get '/', to: "home#index"
    get '/data', to: "home#data"
    get '/show/:id', to: "home#show"
    get '/restricted', to: 'restricted#index'
    resources :tasks
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      sessions: 'users/sessions'
    }

    devise_scope :user do
      get 'sign_out' => 'devise/sessions#destroy'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
