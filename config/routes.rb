Starinme::Application.routes.draw do
	root :to=>"star#mainpage"
	
	get 	":controller(/:action(/:id))"
	post 	":controller(/:action(/:id))"

	get 'auth/:provider/callback', to: 'webapi#loginfacebook'
	get 'logout', to: 'webapi#logoutfacebook'
	
end
