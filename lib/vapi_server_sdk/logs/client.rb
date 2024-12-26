# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/logs_get_request_type"
require_relative "types/logs_get_request_sort_order"
require "date"
require_relative "../types/logs_paginated_response"
require "async"

module Vapi
  class LogsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::LogsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param org_id [String] This is the unique identifier for the org that this log belongs to.
    # @param type [Vapi::Logs::LogsGetRequestType] This is the type of the log.
    # @param webhook_type [String] This is the type of the webhook, given the log is from a webhook.
    # @param assistant_id [String] This is the ID of the assistant.
    # @param phone_number_id [String] This is the ID of the phone number.
    # @param customer_id [String] This is the ID of the customer.
    # @param squad_id [String] This is the ID of the squad.
    # @param call_id [String] This is the ID of the call.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Logs::LogsGetRequestSortOrder] This is the sort order for pagination. Defaults to 'ASC'.
    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::LogsPaginatedResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.logs.get
    def get(org_id: nil, type: nil, webhook_type: nil, assistant_id: nil, phone_number_id: nil, customer_id: nil,
            squad_id: nil, call_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "orgId": org_id,
          "type": type,
          "webhookType": webhook_type,
          "assistantId": assistant_id,
          "phoneNumberId": phone_number_id,
          "customerId": customer_id,
          "squadId": squad_id,
          "callId": call_id,
          "page": page,
          "sortOrder": sort_order,
          "limit": limit,
          "createdAtGt": created_at_gt,
          "createdAtLt": created_at_lt,
          "createdAtGe": created_at_ge,
          "createdAtLe": created_at_le,
          "updatedAtGt": updated_at_gt,
          "updatedAtLt": updated_at_lt,
          "updatedAtGe": updated_at_ge,
          "updatedAtLe": updated_at_le
        }.compact
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/logs"
      end
      Vapi::LogsPaginatedResponse.from_json(json_object: response.body)
    end
  end

  class AsyncLogsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncLogsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param org_id [String] This is the unique identifier for the org that this log belongs to.
    # @param type [Vapi::Logs::LogsGetRequestType] This is the type of the log.
    # @param webhook_type [String] This is the type of the webhook, given the log is from a webhook.
    # @param assistant_id [String] This is the ID of the assistant.
    # @param phone_number_id [String] This is the ID of the phone number.
    # @param customer_id [String] This is the ID of the customer.
    # @param squad_id [String] This is the ID of the squad.
    # @param call_id [String] This is the ID of the call.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Logs::LogsGetRequestSortOrder] This is the sort order for pagination. Defaults to 'ASC'.
    # @param limit [Float] This is the maximum number of items to return. Defaults to 100.
    # @param created_at_gt [DateTime] This will return items where the createdAt is greater than the specified value.
    # @param created_at_lt [DateTime] This will return items where the createdAt is less than the specified value.
    # @param created_at_ge [DateTime] This will return items where the createdAt is greater than or equal to the
    #  specified value.
    # @param created_at_le [DateTime] This will return items where the createdAt is less than or equal to the
    #  specified value.
    # @param updated_at_gt [DateTime] This will return items where the updatedAt is greater than the specified value.
    # @param updated_at_lt [DateTime] This will return items where the updatedAt is less than the specified value.
    # @param updated_at_ge [DateTime] This will return items where the updatedAt is greater than or equal to the
    #  specified value.
    # @param updated_at_le [DateTime] This will return items where the updatedAt is less than or equal to the
    #  specified value.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::LogsPaginatedResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.logs.get
    def get(org_id: nil, type: nil, webhook_type: nil, assistant_id: nil, phone_number_id: nil, customer_id: nil,
            squad_id: nil, call_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "orgId": org_id,
            "type": type,
            "webhookType": webhook_type,
            "assistantId": assistant_id,
            "phoneNumberId": phone_number_id,
            "customerId": customer_id,
            "squadId": squad_id,
            "callId": call_id,
            "page": page,
            "sortOrder": sort_order,
            "limit": limit,
            "createdAtGt": created_at_gt,
            "createdAtLt": created_at_lt,
            "createdAtGe": created_at_ge,
            "createdAtLe": created_at_le,
            "updatedAtGt": updated_at_gt,
            "updatedAtLt": updated_at_lt,
            "updatedAtGe": updated_at_ge,
            "updatedAtLe": updated_at_le
          }.compact
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/logs"
        end
        Vapi::LogsPaginatedResponse.from_json(json_object: response.body)
      end
    end
  end
end
