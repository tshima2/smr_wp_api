Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      resources :waiting_points
      #match 'retrieve_waiting_points', controller: :waiting_points, action: :retrieve
      get 'retrieve_waiting_points', to: 'waiting_points#retrieve'      
    end
  end
end

