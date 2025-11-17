# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/provider_resource_controller_get_provider_resources_paginated_request_provider"
require_relative "types/provider_resource_controller_get_provider_resources_paginated_request_resource_name"
require_relative "types/provider_resource_controller_get_provider_resources_paginated_request_sort_order"
require "date"
require_relative "../types/provider_resource_paginated_response"
require_relative "types/provider_resource_controller_create_provider_resource_request_provider"
require_relative "types/provider_resource_controller_create_provider_resource_request_resource_name"
require_relative "../types/provider_resource"
require_relative "types/provider_resource_controller_get_provider_resource_request_provider"
require_relative "types/provider_resource_controller_get_provider_resource_request_resource_name"
require_relative "types/provider_resource_controller_delete_provider_resource_request_provider"
require_relative "types/provider_resource_controller_delete_provider_resource_request_resource_name"
require_relative "types/provider_resource_controller_update_provider_resource_request_provider"
require_relative "types/provider_resource_controller_update_provider_resource_request_resource_name"
require "async"

module Vapi
  class ProviderResourcesClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::ProviderResourcesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourcesPaginatedRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourcesPaginatedRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param resource_id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourcesPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::ProviderResourcePaginatedResponse]
    def provider_resource_controller_get_provider_resources_paginated(provider:, resource_name:, id: nil,
                                                                      resource_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "resourceId": resource_id,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}"
      end
      Vapi::ProviderResourcePaginatedResponse.from_json(json_object: response.body)
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerCreateProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerCreateProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_create_provider_resource(provider:, resource_name:, request_options: nil)
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}"
      end
      Vapi::ProviderResource.from_json(json_object: response.body)
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_get_provider_resource(provider:, resource_name:, id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}/#{id}"
      end
      Vapi::ProviderResource.from_json(json_object: response.body)
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerDeleteProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerDeleteProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_delete_provider_resource(provider:, resource_name:, id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}/#{id}"
      end
      Vapi::ProviderResource.from_json(json_object: response.body)
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerUpdateProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerUpdateProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_update_provider_resource(provider:, resource_name:, id:, request_options: nil)
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
        unless request_options.nil? || request_options&.additional_body_parameters.nil?
          req.body = { **(request_options&.additional_body_parameters || {}) }.compact
        end
        req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}/#{id}"
      end
      Vapi::ProviderResource.from_json(json_object: response.body)
    end
  end

  class AsyncProviderResourcesClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncProviderResourcesClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourcesPaginatedRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourcesPaginatedRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param resource_id [String]
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourcesPaginatedRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::ProviderResourcePaginatedResponse]
    def provider_resource_controller_get_provider_resources_paginated(provider:, resource_name:, id: nil,
                                                                      resource_id: nil, page: nil, sort_order: nil, limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "resourceId": resource_id,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}"
        end
        Vapi::ProviderResourcePaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerCreateProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerCreateProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_create_provider_resource(provider:, resource_name:, request_options: nil)
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}"
        end
        Vapi::ProviderResource.from_json(json_object: response.body)
      end
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerGetProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_get_provider_resource(provider:, resource_name:, id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}/#{id}"
        end
        Vapi::ProviderResource.from_json(json_object: response.body)
      end
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerDeleteProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerDeleteProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_delete_provider_resource(provider:, resource_name:, id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}/#{id}"
        end
        Vapi::ProviderResource.from_json(json_object: response.body)
      end
    end

    # @param provider [Vapi::ProviderResources::ProviderResourceControllerUpdateProviderResourceRequestProvider] The provider (e.g., 11labs)
    # @param resource_name [Vapi::ProviderResources::ProviderResourceControllerUpdateProviderResourceRequestResourceName] The resource name (e.g., pronunciation-dictionary)
    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::ProviderResource]
    def provider_resource_controller_update_provider_resource(provider:, resource_name:, id:, request_options: nil)
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
          unless request_options.nil? || request_options&.additional_body_parameters.nil?
            req.body = { **(request_options&.additional_body_parameters || {}) }.compact
          end
          req.url "#{@request_client.get_url(request_options: request_options)}/provider/#{provider}/#{resource_name}/#{id}"
        end
        Vapi::ProviderResource.from_json(json_object: response.body)
      end
    end
  end
end
