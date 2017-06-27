Rails.application.routes.draw do
  namespace :v1, :defaults => {:format => :json} do
    get "disputations" => "disputations#index"
    get "disputations/:id" => "disputations#show"

    get "disciplines" => "disciplines#index"
    get "langs" => "langs#index"
    get "places" => "places#index"
    get "subjects" => "subjects#index"
  end
end
