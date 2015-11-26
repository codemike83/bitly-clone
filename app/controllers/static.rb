get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/url' do
	p params[:user_input_long_url]
	url = Url.create(long_url: params[:user_input_long_url])

	redirect "/"
end

get "/:user_input_short_url" do
	url = Url.find_by(short_url: params[:user_input_short_url])

	unless url.nil?
		redirect url.long_url
	else
		redirect "/"
	end
end

