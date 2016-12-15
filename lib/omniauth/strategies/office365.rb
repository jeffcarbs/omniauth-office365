require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Authentication strategy for connecting with the Office365 API.
    class Office365 < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'office365'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, :site => 'https://outlook.office.com/',
                              :authorize_url => 'https://login.microsoftonline.com/common/oauth2/v2.0/authorize',
                              :token_url => 'https://login.microsoftonline.com/common/oauth2/v2.0/token'

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { parsed_uid }

      # https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema#schema-10-and-later
      info do
        {
          :name => jwt_info['name'] || raw_info['DisplayName'],
          :email => parsed_email,
          :first_name => jwt_info['given_name'],
          :last_name => jwt_info['family_name']
        }
      end

      extra do
        {
          :jwt_info => jwt_info,
          :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('api/v2.0/me').parsed
      end

      private

      OFFICE365_JWT_USER_IDENTIFER = 'oid'.freeze
      OFFICE365_JWT_ORGANIZATION_IDENTIFER = 'tid'.freeze
      OFFICE365_JWT_USER_PRINCIPAL_NAME = 'upn'.freeze

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      def decoded_jwt_token
        JWT.decode(access_token.token, nil, false)
      rescue JWT::DecodeError
        []
      end

      def jwt_info
        @jwt_info ||= decoded_jwt_token.first || {}
      end

      def parsed_email
        return raw_info['EmailAddress'] if jwt_info.empty?

        jwt_info[OFFICE365_JWT_USER_PRINCIPAL_NAME]
      end

      def parsed_uid
        return raw_info['Id'] if jwt_info.empty?

        [
          jwt_info[OFFICE365_JWT_USER_IDENTIFER],
          jwt_info[OFFICE365_JWT_ORGANIZATION_IDENTIFER]
        ].join('@')
      end
    end
  end
end
