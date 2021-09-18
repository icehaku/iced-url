Rails.application.routes.draw do
  root 'slugs#new'

  resources :slugs, only: [:new, :create]

  get '(/:short_url)', to: 'slugs#navigate', as: 'slug_navigate'
  get '(/:short_url/stats)', to: 'slugs#stats', as: 'slug_stats'
end
