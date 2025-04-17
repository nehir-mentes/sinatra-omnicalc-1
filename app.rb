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

#Payment with Form
get ("/payment/new") do
  erb(:new_payment)
end
get("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f.to_fs(:percentage, { :precision => 4 } )
  @user_years = params.fetch("user_years").to_f
  @user_pv = params.fetch("user_pv").to_f.to_fs(:currency)
  
  r_term = (params.fetch("user_apr").to_f / 100 / 12)
  nominator = r_term * params.fetch("user_pv").to_f
  loan_term = params.fetch("user_years").to_f * 12
  denominator = 1-((1+r_term) ** (-1*loan_term)) 

  @the_payment = (nominator / denominator).to_fs(:currency)

  erb(:payment_results)
end
