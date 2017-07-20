require 'bundler/setup'
Bundler.require(:default)
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__)+"/../lib/*.rb"].each {|file| require file}

get '/' do
    @companies= Company.all
    @subscribers = Subscriber.all
    erb :index
end
