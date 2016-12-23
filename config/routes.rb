Rails.application.routes.draw do

  resources :calendar_events do
  end

  root "calendars#index"

  devise_for :users, controllers: {
    events: 'users/events',
    registrations: 'users/registrations'
  }

  resources :users do
    resources :calendar_events
  end

  resources :calendars
  get 'users/:id' => 'users#show'
  get '/calendar_events/:id/join_event' => 'calendar_events#join_event', as: 'join_event'
end
