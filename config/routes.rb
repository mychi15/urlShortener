Rails.application.routes.draw do
  resources :shortened_urls
  get '/:token' => 'shortened_urls#go_to_long_url'
  root 'shortened_urls#new'
end
