Rails.application.routes.draw do
  get 'play', to: 'countdown#play'
  get 'score', to: 'countdown#score'
  root to: 'countdown#play'
end
