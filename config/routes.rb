Rails.application.routes.draw do
  resources :shortened_urls

  root 'shortened_urls#new'
end
