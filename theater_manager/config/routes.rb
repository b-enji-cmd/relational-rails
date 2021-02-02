Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get	'/theaters', to: 'theaters#index'
  get '/auditoriums', to: 'auditoriums#index'
end

# have a localized welcome page, that has two routes to Theaters and Audits
#Those two links should lead to their respective pages that contain 
# Index
# Create
# Update
# Destroy
