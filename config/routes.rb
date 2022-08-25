Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'

  get 'deposit', to: 'deposit#index'
  get 'deposit/:id', to: 'deposit#info'
  get 'deposit/new', to: 'deposit#new'
  post 'deposits/create', to: 'deposit#create'

  get 'withdraw', to: 'withdraw#index'
  get 'withdraw/:id', to: 'withdraw#info'
  get 'withdraw/new', to: 'withdraw#new'
  post 'withdraw/create', to: 'withdraw#create'

  get 'transaction', to: 'transaction#index'
  get 'transaction/:id', to: 'transaction#info'
  get 'transaction/new', to: 'transaction#new'
  post 'transaction/create', to: 'transaction#create'

  get 'statement', to: 'statement#index'
  get 'statement/:id', to: 'statement#info'
  get 'statement/new', to: 'statement#new'
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
