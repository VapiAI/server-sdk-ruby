# frozen_string_literal: true

require_relative "../../requests"
require "async"

module Vapi
  class AnalyticsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::AnalyticsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request_options [Vapi::RequestOptions]
    # @return [Void]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.analytics.get
    def get(request_options: nil)
      @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        unless request_options.nil? || request_options&.additional_query_parameters.nil?
          req.params = { **(request_options&.additional_query_parameters || {}) }.compact
        end
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/analytics"
      end
    end
  end

  class AsyncAnalyticsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncAnalyticsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param request_options [Vapi::RequestOptions]
    # @return [Void]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.analytics.get
    def get(request_options: nil)
      Async do
        @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          unless request_options.nil? || request_options&.additional_query_parameters.nil?
            req.params = { **(request_options&.additional_query_parameters || {}) }.compact
          end
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/analytics"
        end
      end
    end
  end
end
