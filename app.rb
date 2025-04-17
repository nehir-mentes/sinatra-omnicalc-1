require "sinatra"
require "sinatra/reloader"

# Homepage
get("/") do
  erb(:new_square)
end

#Square
get ("/square/new") do
  erb(:new_square)
end

get ("/square/results") do
  @the_num = params.fetch("number").to_f
  @the_square = @the_num ** 2
  erb(:square_results)
end

#Square Root
get ("/square_root/new") do
  erb(:new_square_root)
end

get ("/square_root/results") do
  @the_num = params.fetch("number").to_f
  @the_square_root = @the_num ** 0.5
  erb(:square_root_results)
end
