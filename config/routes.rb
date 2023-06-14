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
end