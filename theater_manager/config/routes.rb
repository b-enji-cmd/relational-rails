Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get	'/theaters', to: 'theaters#index'
  get '/theaters/new', to: 'theaters#new'
  get '/auditoriums', to: 'auditoriums#index'
  get '/theaters/:id', to: 'theaters#show'
  get '/theaters/:id/edit', to: 'theaters#edit'

  post '/theaters', to: 'theaters#create'

  patch '/theaters/:id', to: 'theaters#update'
end

# have a localized welcome page, that has two routes to Theaters and Audits
#Those two links should lead to their respective pages that contain 
# Index
# Create
# Update
# Destroy
