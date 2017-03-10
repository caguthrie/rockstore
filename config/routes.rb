Rails.application.routes.draw do
  resources :audio_clips
  
  get '/latest_unread/:mac_address' => 'audio_clips#get_latest_unread'
  get '/is_there_new_clip/:mac_address' => 'audio_clips#is_there_new_clip'
  
  get '/history/:id/:mac_address' => 'audio_history#save'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
