Rails.application.routes.draw do
  devise_for :clients, skip: [:sessions, :registrations, :passwords]
  devise_scope :client do
    # Sessions
    post   '/login',  to: 'clients/sessions#create',  as: :client_session
    delete '/logout', to: 'clients/sessions#destroy', as: :destroy_client_session
    # Registrations
    put    '/sign_up',  to: 'clients/registrations#update', as: nil
    delete '/sign_up',  to: 'clients/registrations#destroy', as: nil
    post   '/sign_up',  to: 'clients/registrations#create', as: nil
    patch  '/sign_up',  to: 'clients/registrations#update', as: :client_registration
  end

  authenticate do
    get '/current_client', to: 'current_client#index'
  end

  resources :payment_methods
  get '/search/movements', to: 'search#movements'
  get '/search/parkings', to: 'search#parkings'
  get '/search/vacancies', to: 'search#vacancies'
  resources :vacancy_reservations, except: [:index, :new, :edit, :update]
  resources :vehicles
end