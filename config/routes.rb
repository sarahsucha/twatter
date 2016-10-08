Rails.application.routes.draw do
  get 'users/new'

  root 'twat_pages#home'

  get '/help', to: 'twat_pages#help'

  get '/about', to: 'twat_pages#about'

  get '/contact', to: 'twat_pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
