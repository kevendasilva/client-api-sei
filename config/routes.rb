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
    # Vehicles
    get '/vehicles', to: 'vehicles#index', as: :vehicles
    post '/vehicles', to: 'vehicles#create', as: nil
    patch '/vehicles/:id', to: 'vehicles#update', as: :vehicle
    put '/vehicles/:id', to: 'vehicles#update', as: nil
    delete '/vehicles/:id', to: 'vehicles#destroy', as: nil
    # Search
    get '/search/movements', to: 'search#movements'
    get '/search/parkings', to: 'search#parkings'
    get '/search/vacancies', to: 'search#vacancies'
    # Payment Methods
    get '/payment_methods', to: 'payment_methods#index', as: :payment_methods
    post '/payment_methods', to: 'payment_methods#create', as: nil
    patch '/payment_methods/:id', to: 'payment_methods#update', as: :payment_method
    put '/payment_methods/:id', to: 'payment_methods#update', as: nil
    delete '/payment_methods/:id', to: 'payment_methods#destroy', as: nil
    # Vacancy Reservations
    post '/vacancy_reservations', to: 'vacancy_reservations#create', as: :vacancy_reservations
    get '/vacancy_reservations', to: 'vacancy_reservations#show', as: :vacancy_reservation
    delete '/vacancy_reservations', to: 'vacancy_reservations#destroy', as: nil
  end
end