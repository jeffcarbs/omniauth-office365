require 'spec_helper'

describe OmniAuth::Strategies::OAuth2 do
  def app
    ->(_env) { [200, {}, ['Hello.']] }
  end

  let(:strategy) do
    OmniAuth::Strategies::Office365.new(nil, @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) { @request }
    end
  end

  before do
    @request = double('Request')
    allow(@request).to receive(:params) { {} }
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  context 'client options' do
    subject { strategy.options.client_options }

    it 'has correct api site' do
      expect(subject.site).to eq('https://outlook.office.com/')
    end

    it 'has correct access token path' do
      expect(subject.token_url).to eq('https://login.microsoftonline.com/common/oauth2/v2.0/token')
    end

    it 'has correct authorize url' do
      expect(subject.authorize_url).to eq('https://login.microsoftonline.com/common/oauth2/v2.0/authorize')
    end
  end
end
