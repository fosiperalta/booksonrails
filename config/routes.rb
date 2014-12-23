Booksonrails::Application.routes.draw do

  resources :books do
    post 'add_to_my_books', :action => :add_to_my_books
    post 'add_to_my_books2', :action => :add_to_my_books2
  end
  resources :users do
    resources :assistances do
      post 'take_book', :action => :take_book
      post 'untake_book', :action => :untake_book
    end
    resources :exemplars do
      get 'search_by_title', :on => :collection
    end
  end
  resources :sessions
  root :to => redirect('/sessions/new')
  match '/home', :to => 'main_pages#home'
  match '/contact', :to => 'main_pages#contact'
  match '/login', :to => 'main_pages#login'
	controller :sessions do
	  get '/logout' => :destroy
	end

  match '/meetings_options', :to => 'main_pages#meetings_options'
  resources :meetings do
    post 'sign_to_meeting', :action => :sign_to_meeting
  end

end
