Rails.application.routes.draw do

  root 'sup_requests#index'
  get 'sup_requests/index'

  get 'sup_requests/done/:id' => "sup_requests#update_status", as: :sup_request_done

  resources :sup_requests

end
