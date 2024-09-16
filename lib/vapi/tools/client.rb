# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "types/tools_list_response_item"
require "json"
require_relative "types/tools_create_request"
require_relative "types/tools_create_response"
require_relative "types/tools_get_response"
require_relative "types/tools_delete_response"
require_relative "types/update_tool_dto_messages_item"
require_relative "../types/open_ai_function"
require_relative "../types/server"
require_relative "types/tools_update_response"
require "async"

module Vapi
  class ToolsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::ToolsClient]
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
    # @return [Array<Vapi::Tools::ToolsListResponseItem>]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.list
    def list(limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil,
             updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/tool"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::Tools::ToolsListResponseItem.from_json(json_object: item)
      end
    end

    # @param request [Vapi::Tools::ToolsCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsCreateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.create
    def create(request:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/tool"
      end
      Vapi::Tools::ToolsCreateResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsGetResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.get(id: "id")
    def get(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/tool/#{id}"
      end
      Vapi::Tools::ToolsGetResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsDeleteResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.delete(id: "id")
    def delete(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/tool/#{id}"
      end
      Vapi::Tools::ToolsDeleteResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param async [Boolean] This determines if the tool is async.
    #  If async, the assistant will move forward without waiting for your server to
    #  respond. This is useful if you just want to trigger something on your server.
    #  If sync, the assistant will wait for your server to respond. This is useful if
    #  want assistant to respond with the result from your server.
    #  Defaults to synchronous (`false`).
    # @param messages [Array<Hash>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.Request of type Array<Vapi::Tools::UpdateToolDtoMessagesItem>, as a Hash
    # @param function [Hash] This is the function definition of the tool.
    #  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
    #  tool-specific fields like `tool.destinations`. But, even in those cases, you can
    #  provide a custom function definition for advanced use cases.
    #  An example of an advanced use case is if you want to customize the message
    #  that's spoken for `endCall` tool. You can specify a function where it returns an
    #  argument "reason". Then, in `messages` array, you can have many
    #  "request-complete" messages. One of these messages will be triggered if the
    #  `messages[].conditions` matches the "reason" argument.Request of type Vapi::OpenAiFunction, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :parameters (Hash)
    #     * :type (String)
    #     * :properties (Hash{String => Vapi::JsonSchema})
    #     * :required (Array<String>)
    # @param server [Hash] This is the server that will be hit when this tool is requested by the model.
    #  All requests will be sent with the call object among other things. You can find
    #  more details in the Server URL documentation.
    #  This overrides the serverUrl set on the org and the phoneNumber. Order of
    #  precedence: highest tool.server.url, then assistant.serverUrl, then
    #  phoneNumber.serverUrl, then org.serverUrl.Request of type Vapi::Server, as a Hash
    #   * :timeout_seconds (Float)
    #   * :url (String)
    #   * :secret (String)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsUpdateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.update(id: "id")
    def update(id:, async: nil, messages: nil, function: nil, server: nil, request_options: nil)
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
          async: async,
          messages: messages,
          function: function,
          server: server
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/tool/#{id}"
      end
      Vapi::Tools::ToolsUpdateResponse.from_json(json_object: response.body)
    end
  end

  class AsyncToolsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncToolsClient]
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
    # @return [Array<Vapi::Tools::ToolsListResponseItem>]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.list
    def list(limit: nil, created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil,
             updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/tool"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::Tools::ToolsListResponseItem.from_json(json_object: item)
        end
      end
    end

    # @param request [Vapi::Tools::ToolsCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsCreateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.create
    def create(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/tool"
        end
        Vapi::Tools::ToolsCreateResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsGetResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.get(id: "id")
    def get(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/tool/#{id}"
        end
        Vapi::Tools::ToolsGetResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsDeleteResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.delete(id: "id")
    def delete(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/tool/#{id}"
        end
        Vapi::Tools::ToolsDeleteResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param async [Boolean] This determines if the tool is async.
    #  If async, the assistant will move forward without waiting for your server to
    #  respond. This is useful if you just want to trigger something on your server.
    #  If sync, the assistant will wait for your server to respond. This is useful if
    #  want assistant to respond with the result from your server.
    #  Defaults to synchronous (`false`).
    # @param messages [Array<Hash>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.Request of type Array<Vapi::Tools::UpdateToolDtoMessagesItem>, as a Hash
    # @param function [Hash] This is the function definition of the tool.
    #  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
    #  tool-specific fields like `tool.destinations`. But, even in those cases, you can
    #  provide a custom function definition for advanced use cases.
    #  An example of an advanced use case is if you want to customize the message
    #  that's spoken for `endCall` tool. You can specify a function where it returns an
    #  argument "reason". Then, in `messages` array, you can have many
    #  "request-complete" messages. One of these messages will be triggered if the
    #  `messages[].conditions` matches the "reason" argument.Request of type Vapi::OpenAiFunction, as a Hash
    #   * :name (String)
    #   * :description (String)
    #   * :parameters (Hash)
    #     * :type (String)
    #     * :properties (Hash{String => Vapi::JsonSchema})
    #     * :required (Array<String>)
    # @param server [Hash] This is the server that will be hit when this tool is requested by the model.
    #  All requests will be sent with the call object among other things. You can find
    #  more details in the Server URL documentation.
    #  This overrides the serverUrl set on the org and the phoneNumber. Order of
    #  precedence: highest tool.server.url, then assistant.serverUrl, then
    #  phoneNumber.serverUrl, then org.serverUrl.Request of type Vapi::Server, as a Hash
    #   * :timeout_seconds (Float)
    #   * :url (String)
    #   * :secret (String)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Tools::ToolsUpdateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.tools.update(id: "id")
    def update(id:, async: nil, messages: nil, function: nil, server: nil, request_options: nil)
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
            async: async,
            messages: messages,
            function: function,
            server: server
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/tool/#{id}"
        end
        Vapi::Tools::ToolsUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end
