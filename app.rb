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

get '/subscriber/:id' do
    @subscriber=Subscriber.find(params.fetch('id').to_i())
    @companies=Company.all
    @interest=Company.joins(:subscriptions).where(subscriptions: {subscriber_id: @subscriber.id})
    erb :subscriber
end

#subscription connection 
post '/subscriber/:id' do
    @company_id=params.fetch('select').to_i
    @subscriber_id=params.fetch('id').to_i
    Subscription.create(company_id: @company_id, subscriber_id: @subscriber_id)
    redirect '/subscriber/'.concat(@subscriber_id.to_s)
end
