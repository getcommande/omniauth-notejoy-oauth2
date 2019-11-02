# frozen_string_literal: true

require 'omniauth/strategies/oauth2'
require 'uri'

# Potential scopes: https://notejoy.com/help/api
# read_all write_all

module OmniAuth
  module Strategies
    # Omniauth strategy for Notejoy
    class NotejoyOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'notejoy_oauth2'

      option :client_options,
             site: 'https://notejoy.com',
             authorize_url: 'https://notejoy.com/oauth/authorize',
             token_url: 'https://notejoy.com/api/1.0/oauth/token'

      extra do
        { :raw_info => raw_info }
      end

      info do
        { name: '', email: '' }
      end

      def raw_info
        @raw_info
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end
