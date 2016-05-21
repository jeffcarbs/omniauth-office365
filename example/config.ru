require 'bundler/setup'
require 'omniauth-office365'
require './app.rb'

use Rack::Session::Cookie, :secret => 'abc123'

use OmniAuth::Builder do
  provider :office365, ENV['OFFICE365_APP_ID'], ENV['OFFICE365_APP_SECRET'], :scope => 'https://outlook.office.com/mail.read'
end

run Sinatra::Application
