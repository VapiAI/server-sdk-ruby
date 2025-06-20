# frozen_string_literal: true
require_relative "../../requests"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "types/knowledge_bases_list_response_item"
require "json"
require_relative "types/knowledge_bases_create_request"
require_relative "types/knowledge_bases_create_response"
require_relative "types/knowledge_bases_get_response"
require_relative "types/knowledge_bases_delete_response"
require_relative "types/knowledge_bases_update_request"
require_relative "types/knowledge_bases_update_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vapi
  class KnowledgeBasesClient
  # @return [Vapi::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vapi::RequestClient] 
    # @return [Vapi::KnowledgeBasesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
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
    # @return [Array<Vapi::KnowledgeBases::KnowledgeBasesListResponseItem>]
    def list(limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "createdAtGt": created_at_gt, "createdAtLt": created_at_lt, "createdAtGe": created_at_ge, "createdAtLe": created_at_le, "updatedAtGt": updated_at_gt, "updatedAtLt": updated_at_lt, "updatedAtGe": updated_at_ge, "updatedAtLe": updated_at_le }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        Vapi::KnowledgeBases::KnowledgeBasesListResponseItem.from_json(json_object: item)
      end
    end
    # @param request [Vapi::KnowledgeBases::KnowledgeBasesCreateRequest] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesCreateResponse]
    def create(request:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base"
end
      Vapi::KnowledgeBases::KnowledgeBasesCreateResponse.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesGetResponse]
    def get(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base/#{id}"
end
      Vapi::KnowledgeBases::KnowledgeBasesGetResponse.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesDeleteResponse]
    def delete(id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base/#{id}"
end
      Vapi::KnowledgeBases::KnowledgeBasesDeleteResponse.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param request [Vapi::KnowledgeBases::KnowledgeBasesUpdateRequest] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse]
    def update(id:, request:, request_options: nil)
      response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base/#{id}"
end
      Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse.from_json(json_object: response.body)
    end
  end
  class AsyncKnowledgeBasesClient
  # @return [Vapi::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vapi::RequestClient] 
    # @return [Vapi::AsyncKnowledgeBasesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
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
    # @return [Array<Vapi::KnowledgeBases::KnowledgeBasesListResponseItem>]
    def list(limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "createdAtGt": created_at_gt, "createdAtLt": created_at_lt, "createdAtGe": created_at_ge, "createdAtLe": created_at_le, "updatedAtGt": updated_at_gt, "updatedAtLt": updated_at_lt, "updatedAtGe": updated_at_ge, "updatedAtLe": updated_at_le }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          Vapi::KnowledgeBases::KnowledgeBasesListResponseItem.from_json(json_object: item)
        end
      end
    end
    # @param request [Vapi::KnowledgeBases::KnowledgeBasesCreateRequest] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesCreateResponse]
    def create(request:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base"
end
        Vapi::KnowledgeBases::KnowledgeBasesCreateResponse.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesGetResponse]
    def get(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base/#{id}"
end
        Vapi::KnowledgeBases::KnowledgeBasesGetResponse.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesDeleteResponse]
    def delete(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base/#{id}"
end
        Vapi::KnowledgeBases::KnowledgeBasesDeleteResponse.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param request [Vapi::KnowledgeBases::KnowledgeBasesUpdateRequest] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse]
    def update(id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/knowledge-base/#{id}"
end
        Vapi::KnowledgeBases::KnowledgeBasesUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end