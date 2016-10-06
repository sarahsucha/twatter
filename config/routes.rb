Rails.application.routes.draw do
  root 'twat_pages#home'

  get 'twat_pages/home'

  get 'twat_pages/help'

  get 'twat_pages/about'

  get 'twat_pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
