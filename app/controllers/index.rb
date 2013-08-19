get '/' do
  # render home page
  #TODO: Show all users if user is signed in
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  @email = @user.email
  session[:user_id] = @user.id
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear # see application.js file and layout.erb
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])
  @user.save!
  session[:user_id] = @user.id
  redirect '/'
end
