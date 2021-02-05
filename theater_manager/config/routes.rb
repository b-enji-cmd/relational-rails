Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get	'/theaters', to: 'theaters#index'
  get '/theaters/new', to: 'theaters#new'
  get '/theaters/:id', to: 'theaters#show'
  get '/theaters/:id/edit', to: 'theaters#edit'

  get '/auditoriums', to: 'auditoriums#index'
  get '/auditoriums/new', to: 'auditoriums#new'
  get '/auditoriums/:id', to: 'auditoriums#show'
  get '/auditoriums/:id/edit', to: 'auditoriums#edit'

  post '/theaters', to: 'theaters#create'
  post '/auditoriums', to: 'auditoriums#create'

  patch '/auditoriums/:id', to: 'auditoriums#update'
  patch '/theaters/:id', to: 'theaters#update'

  delete '/theaters/:id', to: 'theaters#destroy'
  delete '/auditoriums/:id', to: 'auditoriums#destroy'

end

# have a localized welcome page, that has two routes to Theaters and Audits
#Those two links should lead to their respective pages that contain
# Index
# Create
# Update
# Destroy
