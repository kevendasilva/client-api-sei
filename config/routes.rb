Rails.application.routes.draw do
  devise_for :clients, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'sign_up'
  },
  controllers: {
    sessions: 'clients/sessions',
    registrations: 'clients/registrations'
  }

  get '/current_client', to: 'current_client#index'
  get '/search/parkings', to: 'search#parkings'
  get '/search/vacancies', to: 'search#vacancies'
  resources :vacancy_reservations, except: [:index, :new, :edit, :update]
end