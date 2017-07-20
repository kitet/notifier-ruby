require 'bundler/setup'
Bundler.require(:default)
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__)+"/../lib/*.rb"].each {|file| require file}

get '/' do
    @companies= Company.all
    @subscribers = Subscriber.all
    erb :index
end

post '/index/company/new' do
    @company_name=params.fetch('name')
    @company_email=params.fetch('email')
    Company.create(name: @company_name, email: @company_email)
    redirect '/'
end


post '/index/subscriber/new' do
    @subscriber_name=params.fetch('name')
    @subscriber_email=params.fetch('email')
    Subscriber.create(name:@subscriber_name, email:@subscriber_email)
    redirect '/'
end

