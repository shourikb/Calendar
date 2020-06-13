Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
  	authenticated :user do
   	 root 'meetings#index', as: :authenticated_root
  	end

  	unauthenticated do
    	root 'devise/sessions#new', as: :unauthenticated_root
  	end
  end

  get "meetings" => "meetings#index"
  get "meetings/new" => "meetings#new"
  post "meetings" => "meetings#create"
  get "meetings/:id" => "meetings#moreinfo", as: "meeting"
  get "meetings/:id/edit" => "meetings#edit", as: "meeting_edit"
  patch "meetings/:id" => "meetings#update"
  delete "meetings/:id" => "meetings#delete"


end
