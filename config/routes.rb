Rails.application.routes.draw do
  namespace :auth do
    get 'signin', to: 'login#new'
    post 'signin', to: 'login#create'
  end
end
