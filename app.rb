require "sinatra"
require "sinatra/reloader"

get("/") do
  redirect to("/square/new")
end

#square form route
get("/square/new") do
  	
  erb(:square, { :layout => :wrapper })

end

#square result route
get("/square/results") do
  number = params[:number].to_f
  square = number**2

  erb(:square_results, { :locals => { :number => number, :square => square }, :layout => :wrapper })
end

#square root form route
get("/square_root/new") do

  erb(:square_root, { :layout => :wrapper})

end

#square root results form
get("/square_root/results") do
  number = params[:number].to_f
  square_root = number**0.5

  erb(:square_root_results, { :locals => { :number => number, :square_root => square_root }, :layout => :wrapper})
end  

#payment form route
get("/payment/new") do

  erb(:payment, { :layout => :wrapper})

end

#payment results form
get("/payment/results") do
  apr = params[:apr].to_f
  years = params[:years].to_i
  principal = params[:principal].to_f

  r = (apr/100)/12
  n = years*12

  if r == 0
    payment = (principal/n).round(2)
  else
    payment = ((r*principal)/(1-((1+r)**-n))).round(2)
  end
  
  formatted_apr = "#{format('%.4f', apr)}"
  formatted_principal = "#{format('%.2f', principal).to_s.gsub(/(\d)(?=(\d{3})+\.)/, '\\1,')}"
  formatted_payment = "#{format('%.2f', payment).to_s.gsub(/(\d)(?=(\d{3})+\.)/, '\\1,')}" 

  erb(:payment_results, { :locals => { :apr => formatted_apr, :years => years, :principal => formatted_principal, :payment => formatted_payment }, :layout => :wrapper})
end  

#random form route
get("/random/new") do

  erb(:random, { :layout => :wrapper})

end

#payment results form
get("/random/results") do
  min = params[:min].to_f
  max = params[:max].to_f
  
  random = rand(min..max)

  erb(:random_results, { :locals => { :min => min, :max => max, :random => random }, :layout => :wrapper})
end  
