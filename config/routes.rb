Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  get 'about_us', to: 'about_us#index'

  get 'deposit', to: 'deposit#index'
  get 'deposit/new', to: 'deposit#new'
  post 'deposit/create', to: 'deposit#create'

  get 'withdraw', to: 'withdraw#index'
  get 'withdraw/new', to: 'withdraw#new'
  post 'withdraw/create', to: 'withdraw#create'

  get 'transaction', to: 'transaction#index'
  get 'transaction/new', to: 'transaction#new'
  get 'transaction/info/:id', to: 'transaction#info'
  post 'transaction/create', to: 'transaction#create'

  get 'statement', to: 'statement#index'
  get 'statement/new', to: 'statement#new'
  get 'statement/info/:id', to: 'statement#info'
  post 'statement/feed', to: 'statement#feed'
  post 'statement/create', to: 'statement#create'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omniauth: 'users/omniauth',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  root 'landing#index'
end
