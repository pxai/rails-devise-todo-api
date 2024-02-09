Rails.application.routes.draw do
  defaults format: :json do
    root to: "home#index"
    get '/', to: "home#index"
    get '/restricted', to: 'restricted#index'
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
