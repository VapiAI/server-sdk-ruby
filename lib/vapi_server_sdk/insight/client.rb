# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/insight_controller_find_all_request_sort_order"
require "date"
require_relative "../types/insight_paginated_response"
require_relative "types/insight_controller_create_request"
require_relative "types/insight_controller_create_response"
require_relative "types/insight_controller_find_one_response"
require_relative "types/insight_controller_remove_response"
require_relative "types/insight_controller_update_request_body"
require_relative "types/insight_controller_update_response"
require_relative "../types/insight_run_format_plan"
require_relative "../types/insight_time_range_with_step"
require_relative "../types/insight_run_response"
require_relative "types/insight_controller_preview_request"
require "async"

module Vapi
  class InsightClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::InsightClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Insight::InsightControllerFindAllRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::InsightPaginatedResponse]
    def insight_controller_find_all(id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil,
                                    created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "id": id,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight"
      end
      Vapi::InsightPaginatedResponse.from_json(json_object: response.body)
    end

    # @param request [Vapi::Insight::InsightControllerCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerCreateResponse]
    def insight_controller_create(request:, request_options: nil)
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight"
      end
      Vapi::Insight::InsightControllerCreateResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerFindOneResponse]
    def insight_controller_find_one(id:, request_options: nil)
      response = @request_client.conn.get do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}"
      end
      Vapi::Insight::InsightControllerFindOneResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerRemoveResponse]
    def insight_controller_remove(id:, request_options: nil)
      response = @request_client.conn.delete do |req|
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
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}"
      end
      Vapi::Insight::InsightControllerRemoveResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request [Vapi::Insight::InsightControllerUpdateRequestBody]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerUpdateResponse]
    def insight_controller_update(id:, request:, request_options: nil)
      response = @request_client.conn.patch do |req|
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}"
      end
      Vapi::Insight::InsightControllerUpdateResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param format_plan [Hash] Request of type Vapi::InsightRunFormatPlan, as a Hash
    #   * :format (Vapi::InsightRunFormatPlanFormat)
    # @param time_range_override [Hash] This is the optional time range override for the insight.
    #  If provided, overrides every field in the insight's timeRange.
    #  If this is provided with missing fields, defaults will be used, not the
    #  insight's timeRange.
    #  start default - "-7d"
    #  end default - "now"
    #  step default - "day"
    #  For Pie and Text Insights, step will be ignored even if provided.Request of type Vapi::InsightTimeRangeWithStep, as a Hash
    #   * :step (Vapi::InsightTimeRangeWithStepStep)
    #   * :start (Hash{String => Object})
    #   * :end_ (Hash{String => Object})
    #   * :timezone (String)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::InsightRunResponse]
    def insight_controller_run(id:, format_plan: nil, time_range_override: nil, request_options: nil)
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
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          formatPlan: format_plan,
          timeRangeOverride: time_range_override
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}/run"
      end
      Vapi::InsightRunResponse.from_json(json_object: response.body)
    end

    # @param request [Vapi::Insight::InsightControllerPreviewRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::InsightRunResponse]
    def insight_controller_preview(request:, request_options: nil)
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
        req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/preview"
      end
      Vapi::InsightRunResponse.from_json(json_object: response.body)
    end
  end

  class AsyncInsightClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncInsightClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::Insight::InsightControllerFindAllRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::InsightPaginatedResponse]
    def insight_controller_find_all(id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil,
                                    created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "id": id,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight"
        end
        Vapi::InsightPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param request [Vapi::Insight::InsightControllerCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerCreateResponse]
    def insight_controller_create(request:, request_options: nil)
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight"
        end
        Vapi::Insight::InsightControllerCreateResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerFindOneResponse]
    def insight_controller_find_one(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}"
        end
        Vapi::Insight::InsightControllerFindOneResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerRemoveResponse]
    def insight_controller_remove(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do |req|
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
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}"
        end
        Vapi::Insight::InsightControllerRemoveResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request [Vapi::Insight::InsightControllerUpdateRequestBody]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Insight::InsightControllerUpdateResponse]
    def insight_controller_update(id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}"
        end
        Vapi::Insight::InsightControllerUpdateResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param format_plan [Hash] Request of type Vapi::InsightRunFormatPlan, as a Hash
    #   * :format (Vapi::InsightRunFormatPlanFormat)
    # @param time_range_override [Hash] This is the optional time range override for the insight.
    #  If provided, overrides every field in the insight's timeRange.
    #  If this is provided with missing fields, defaults will be used, not the
    #  insight's timeRange.
    #  start default - "-7d"
    #  end default - "now"
    #  step default - "day"
    #  For Pie and Text Insights, step will be ignored even if provided.Request of type Vapi::InsightTimeRangeWithStep, as a Hash
    #   * :step (Vapi::InsightTimeRangeWithStepStep)
    #   * :start (Hash{String => Object})
    #   * :end_ (Hash{String => Object})
    #   * :timezone (String)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::InsightRunResponse]
    def insight_controller_run(id:, format_plan: nil, time_range_override: nil, request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            formatPlan: format_plan,
            timeRangeOverride: time_range_override
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/#{id}/run"
        end
        Vapi::InsightRunResponse.from_json(json_object: response.body)
      end
    end

    # @param request [Vapi::Insight::InsightControllerPreviewRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::InsightRunResponse]
    def insight_controller_preview(request:, request_options: nil)
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
          req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/reporting/insight/preview"
        end
        Vapi::InsightRunResponse.from_json(json_object: response.body)
      end
    end
  end
end
