# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/scorecard"
require_relative "../types/scorecard_metric"
require_relative "types/scorecard_controller_get_paginated_request_sort_order"
require "date"
require_relative "../types/scorecard_paginated_response"
require_relative "../types/create_scorecard_dto"
require "async"

module Vapi
  class ObservabilityScorecardClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::ObservabilityScorecardClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_get(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard/#{id}"
      end
      Vapi::Scorecard.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_remove(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard/#{id}"
      end
      Vapi::Scorecard.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param name [String] This is the name of the scorecard. It is only for user reference and will not be
    #  used for any evaluation.
    # @param description [String] This is the description of the scorecard. It is only for user reference and will
    #  not be used for any evaluation.
    # @param metrics [Array<Hash>] These are the metrics that will be used to evaluate the scorecard.
    #  Each metric will have a set of conditions and points that will be used to
    #  generate the score.Request of type Array<Vapi::ScorecardMetric>, as a Hash
    #   * :structured_output_id (String)
    #   * :conditions (Array<Hash{String => Object}>)
    # @param assistant_ids [Array<String>] These are the assistant IDs that this scorecard is linked to.
    #  When linked to assistants, this scorecard will be available for evaluation
    #  during those assistants' calls.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_update(id:, name: nil, description: nil, metrics: nil, assistant_ids: nil,
                                    request_options: nil)
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
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          name: name,
          description: description,
          metrics: metrics,
          assistantIds: assistant_ids
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard/#{id}"
      end
      Vapi::Scorecard.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::ObservabilityScorecard::ScorecardControllerGetPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::ScorecardPaginatedResponse]
    def scorecard_controller_get_paginated(id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard"
      end
      Vapi::ScorecardPaginatedResponse.from_json(json_object: response.body)
    end

    # @param request [Hash] Request of type Vapi::CreateScorecardDto, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :metrics (Array<Vapi::ScorecardMetric>)
    #   * :assistant_ids (Array<String>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_create(request:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard"
      end
      Vapi::Scorecard.from_json(json_object: response.body)
    end
  end

  class AsyncObservabilityScorecardClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncObservabilityScorecardClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_get(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard/#{id}"
        end
        Vapi::Scorecard.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_remove(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard/#{id}"
        end
        Vapi::Scorecard.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param name [String] This is the name of the scorecard. It is only for user reference and will not be
    #  used for any evaluation.
    # @param description [String] This is the description of the scorecard. It is only for user reference and will
    #  not be used for any evaluation.
    # @param metrics [Array<Hash>] These are the metrics that will be used to evaluate the scorecard.
    #  Each metric will have a set of conditions and points that will be used to
    #  generate the score.Request of type Array<Vapi::ScorecardMetric>, as a Hash
    #   * :structured_output_id (String)
    #   * :conditions (Array<Hash{String => Object}>)
    # @param assistant_ids [Array<String>] These are the assistant IDs that this scorecard is linked to.
    #  When linked to assistants, this scorecard will be available for evaluation
    #  during those assistants' calls.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_update(id:, name: nil, description: nil, metrics: nil, assistant_ids: nil,
                                    request_options: nil)
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
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            name: name,
            description: description,
            metrics: metrics,
            assistantIds: assistant_ids
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard/#{id}"
        end
        Vapi::Scorecard.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::ObservabilityScorecard::ScorecardControllerGetPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::ScorecardPaginatedResponse]
    def scorecard_controller_get_paginated(id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard"
        end
        Vapi::ScorecardPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param request [Hash] Request of type Vapi::CreateScorecardDto, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :metrics (Array<Vapi::ScorecardMetric>)
    #   * :assistant_ids (Array<String>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Scorecard]
    def scorecard_controller_create(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/observability/scorecard"
        end
        Vapi::Scorecard.from_json(json_object: response.body)
      end
    end
  end
end
