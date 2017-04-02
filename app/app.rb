# encoding: utf-8
APP_ROOT = File.expand_path(File.dirname(__FILE__))
APP_NAME = 'myapp'

require 'bundler'
Bundler.require
require 'tilt/erb'

require './model/init'
require './controller/init'

Encoding.default_external = "UTF-8"

include ERB::Util

configure do
    use Rack::Session::Pool,
      :expire_after => 900,
      :key => 'JSESSIONID'
#      set :logger, Logger.new(STDOUT)
#logger = Logger.new(STDOUT)
    set :root, APP_ROOT
    set :port, 8081
    set :bind, '0.0.0.0'
    (set :show_exceptions, false) if (settings.environment == :production)
    #enable :sessions
    set :session_secret, '9y7lIjCPUByfJVwjGyY77Tt5oCrtVhZi'
end

before do
  session[:errors] || session[:errors] = {}
  content_type 'application/json'
  #redirect to '/login' unless (authenticated? or request.path == '/login')
end

def authorized?
  #return false unless session[:user]
  session[:return_to] = request.url
  redirect to '/login' unless session[:user]
end
