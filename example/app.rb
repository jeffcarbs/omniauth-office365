require 'sinatra'

# Configure sinatra
set :run, false
set :raise_errors, true
set :protection, :except => [:json_csrf]

# Setup logging to file
log = File.new('app.log', 'a+')
$stdout.reopen(log)
$stderr.reopen(log)
$stderr.sync = true
$stdout.sync = true

get '/' do
  redirect '/auth/office365'
end

get '/auth/:provider/callback' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end

get '/auth/failure' do
  content_type 'application/json'
  MultiJson.encode(request.env)
end
