require "sinatra"
require "sinatra/reloader"

get ("/howdy") do
  erb(:hello)
end

get ("/square/new") do
  erb(:new_square)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
