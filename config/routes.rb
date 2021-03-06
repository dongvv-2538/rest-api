Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles do 
    resources :comments, only: %i[index create]
  end

  post 'login', to: 'access_tokens#create'
  delete 'logout', to: 'access_tokens#destroy'
  post 'signup', to: 'registrations#create'

end
