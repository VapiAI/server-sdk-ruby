# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/analytics_query"
require_relative "../types/analytics_query_result"
require "json"
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

    # @param queries [Array<Hash>] This is the list of metric queries you want to perform.Request of type Array<Vapi::AnalyticsQuery>, as a Hash
    #   * :table (Vapi::AnalyticsQueryTable)
    #   * :group_by (Array<Vapi::AnalyticsQueryGroupByItem>)
    #   * :group_by_variable_value (Array<Vapi::VariableValueGroupBy>)
    #   * :name (String)
    #   * :time_range (Hash)
    #     * :step (Vapi::TimeRangeStep)
    #     * :start (DateTime)
    #     * :end_ (DateTime)
    #     * :timezone (String)
    #   * :operations (Array<Vapi::AnalyticsOperation>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Vapi::AnalyticsQueryResult>]
    def get(queries:, request_options: nil)
      response = @request_client.conn.post do |req|
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
        req.body = { **(request_options&.additional_body_parameters || {}), queries: queries }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/analytics"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::AnalyticsQueryResult.from_json(json_object: item)
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

    # @param queries [Array<Hash>] This is the list of metric queries you want to perform.Request of type Array<Vapi::AnalyticsQuery>, as a Hash
    #   * :table (Vapi::AnalyticsQueryTable)
    #   * :group_by (Array<Vapi::AnalyticsQueryGroupByItem>)
    #   * :group_by_variable_value (Array<Vapi::VariableValueGroupBy>)
    #   * :name (String)
    #   * :time_range (Hash)
    #     * :step (Vapi::TimeRangeStep)
    #     * :start (DateTime)
    #     * :end_ (DateTime)
    #     * :timezone (String)
    #   * :operations (Array<Vapi::AnalyticsOperation>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Vapi::AnalyticsQueryResult>]
    def get(queries:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
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
          req.body = { **(request_options&.additional_body_parameters || {}), queries: queries }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/analytics"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::AnalyticsQueryResult.from_json(json_object: item)
        end
      end
    end
  end
end
