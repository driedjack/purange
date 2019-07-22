Rails.application.routes.draw do
  namespace :admin do
    root to: 'general#dashboard'
    get :login, to: 'sessions#new'
    post :login, to: 'sessions#create'
    delete :sign_out, to: 'sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
