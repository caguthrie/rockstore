Rails.application.routes.draw do
  resources :audio_clips
  
  get '/latest_unread/:mac_address' => 'audio_clips#get_latest_unread'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
