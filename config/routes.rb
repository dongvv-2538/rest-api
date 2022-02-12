Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles, only: %i[index show create]
  post 'login', to: 'access_tokens#create'
  delete 'logout', to: 'access_tokens#destroy'

end
