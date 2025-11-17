# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/structured_output_controller_find_all_request_sort_order"
require "date"
require_relative "../types/structured_output_paginated_response"
require_relative "../types/create_structured_output_dto"
require_relative "../types/structured_output"
require_relative "types/update_structured_output_dto_model"
require_relative "../types/compliance_override"
require_relative "../types/json_schema"
require "json"
require "async"

module Vapi
  class StructuredOutputsClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::StructuredOutputsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String] This will return structured outputs where the id matches the specified value.
    # @param name [String] This will return structured outputs where the name matches the specified value.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::StructuredOutputs::StructuredOutputControllerFindAllRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::StructuredOutputPaginatedResponse]
    def structured_output_controller_find_all(id: nil, name: nil, page: nil, sort_order: nil, limit: nil,
                                              created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
          "name": name,
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
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output"
      end
      Vapi::StructuredOutputPaginatedResponse.from_json(json_object: response.body)
    end

    # @param request [Hash] Request of type Vapi::CreateStructuredOutputDto, as a Hash
    #   * :model (Hash)
    #   * :compliance_plan (Hash)
    #     * :force_store_on_hipaa_enabled (Boolean)
    #   * :name (String)
    #   * :schema (Hash)
    #     * :type (Vapi::JsonSchemaType)
    #     * :items (Hash{String => Object})
    #     * :properties (Hash{String => Object})
    #     * :description (String)
    #     * :pattern (String)
    #     * :format (Vapi::JsonSchemaFormat)
    #     * :required (Array<String>)
    #     * :enum (Array<String>)
    #     * :title (String)
    #   * :description (String)
    #   * :assistant_ids (Array<String>)
    #   * :workflow_ids (Array<String>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_create(request:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output"
      end
      Vapi::StructuredOutput.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_find_one(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/#{id}"
      end
      Vapi::StructuredOutput.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_remove(id:, request_options: nil)
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
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/#{id}"
      end
      Vapi::StructuredOutput.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param schema_override [String]
    # @param model [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel] This is the model that will be used to extract the structured output.
    #  To provide your own custom system and user prompts for structured output
    #  extraction, populate the messages array with your system and user messages. You
    #  can specify liquid templating in your system and user messages.
    #  Between the system or user messages, you must reference either 'transcript' or
    #  'messages' with the '{{}}' syntax to access the conversation history.
    #  Between the system or user messages, you must reference a variation of the
    #  structured output with the '{{}}' syntax to access the structured output
    #  definition.
    #  i.e.:
    #  {{structuredOutput}}
    #  {{structuredOutput.name}}
    #  {{structuredOutput.description}}
    #  {{structuredOutput.schema}}
    #  If model is not specified, GPT-4.1 will be used by default for extraction,
    #  utilizing default system and user prompts.
    #  If messages or required fields are not specified, the default system and user
    #  prompts will be used.
    # @param compliance_plan [Hash] Compliance configuration for this output. Only enable overrides if no sensitive
    #  data will be stored.Request of type Vapi::ComplianceOverride, as a Hash
    #   * :force_store_on_hipaa_enabled (Boolean)
    # @param name [String] This is the name of the structured output.
    # @param description [String] This is the description of what the structured output extracts.
    #  Use this to provide context about what data will be extracted and how it will be
    #  used.
    # @param assistant_ids [Array<String>] These are the assistant IDs that this structured output is linked to.
    #  When linked to assistants, this structured output will be available for
    #  extraction during those assistant's calls.
    # @param workflow_ids [Array<String>] These are the workflow IDs that this structured output is linked to.
    #  When linked to workflows, this structured output will be available for
    #  extraction during those workflow's execution.
    # @param schema [Hash] This is the JSON Schema definition for the structured output.
    #  Defines the structure and validation rules for the data that will be extracted.
    #  Supports all JSON Schema features including:
    #  - Objects and nested properties
    #  - Arrays and array validation
    #  - String, number, boolean, and null types
    #  - Enums and const values
    #  - Validation constraints (min/max, patterns, etc.)
    #  - Composition with allOf, anyOf, oneOfRequest of type Vapi::JsonSchema, as a Hash
    #   * :type (Vapi::JsonSchemaType)
    #   * :items (Hash{String => Object})
    #   * :properties (Hash{String => Object})
    #   * :description (String)
    #   * :pattern (String)
    #   * :format (Vapi::JsonSchemaFormat)
    #   * :required (Array<String>)
    #   * :enum (Array<String>)
    #   * :title (String)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_update(id:, schema_override:, model: nil, compliance_plan: nil, name: nil,
                                            description: nil, assistant_ids: nil, workflow_ids: nil, schema: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
        req.headers = {
      **(req.headers || {}),
      **@request_client.get_headers,
      **(request_options&.additional_headers || {})
        }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "schemaOverride": schema_override
        }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          model: model,
          compliancePlan: compliance_plan,
          name: name,
          description: description,
          assistantIds: assistant_ids,
          workflowIds: workflow_ids,
          schema: schema
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/#{id}"
      end
      Vapi::StructuredOutput.from_json(json_object: response.body)
    end

    # @param preview_enabled [Boolean] This is the preview flag for the re-run. If true, the re-run will be executed
    #  and the response will be returned immediately and the call artifact will NOT be
    #  updated.
    #  If false (default), the re-run will be executed and the response will be updated
    #  in the call artifact.
    # @param structured_output_id [String] This is the ID of the structured output that will be run. This must be provided
    #  unless a transient structured output is provided.
    #  When the re-run is executed, only the value of this structured output will be
    #  replaced with the new value, or added if not present.
    # @param structured_output [Hash] This is the transient structured output that will be run. This must be provided
    #  if a structured output ID is not provided.
    #  When the re-run is executed, the structured output value will be added to the
    #  existing artifact.Request of type Vapi::CreateStructuredOutputDto, as a Hash
    #   * :model (Hash)
    #   * :compliance_plan (Hash)
    #     * :force_store_on_hipaa_enabled (Boolean)
    #   * :name (String)
    #   * :schema (Hash)
    #     * :type (Vapi::JsonSchemaType)
    #     * :items (Hash{String => Object})
    #     * :properties (Hash{String => Object})
    #     * :description (String)
    #     * :pattern (String)
    #     * :format (Vapi::JsonSchemaFormat)
    #     * :required (Array<String>)
    #     * :enum (Array<String>)
    #     * :title (String)
    #   * :description (String)
    #   * :assistant_ids (Array<String>)
    #   * :workflow_ids (Array<String>)
    # @param call_ids [Array<String>] This is the array of callIds that will be updated with the new structured output
    #  value. If preview is true, this array must be provided and contain exactly 1
    #  callId.
    #  If preview is false, up to 100 callIds may be provided.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_run(call_ids:, preview_enabled: nil, structured_output_id: nil,
                                         structured_output: nil, request_options: nil)
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
          previewEnabled: preview_enabled,
          structuredOutputId: structured_output_id,
          structuredOutput: structured_output,
          callIds: call_ids
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/run"
      end
      Vapi::StructuredOutput.from_json(json_object: response.body)
    end

    # Analyzes assistant configuration and generates contextual structured output
    #  recommendations
    #
    # @param assistant_id [String] The assistant ID to analyze and generate suggestions for
    # @param count [Float] Number of suggestions to generate
    # @param exclude_ids [Array<String>] Existing structured output IDs to exclude from suggestions
    # @param seed [Float] Iteration/seed for generating diverse suggestions (0 = first generation, 1+ =
    #  regenerations with increasing specificity)
    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Hash{String => Object}>]
    def structured_output_controller_suggest(assistant_id:, count: nil, exclude_ids: nil, seed: nil,
                                             request_options: nil)
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
          assistantId: assistant_id,
          count: count,
          excludeIds: exclude_ids,
          seed: seed
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/suggest"
      end
      JSON.parse(response.body)
    end
  end

  class AsyncStructuredOutputsClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncStructuredOutputsClient]
    def initialize(request_client:)
      @request_client = request_client
    end

    # @param id [String] This will return structured outputs where the id matches the specified value.
    # @param name [String] This will return structured outputs where the name matches the specified value.
    # @param page [Float] This is the page number to return. Defaults to 1.
    # @param sort_order [Vapi::StructuredOutputs::StructuredOutputControllerFindAllRequestSortOrder] This is the sort order for pagination. Defaults to 'DESC'.
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
    # @return [Vapi::StructuredOutputPaginatedResponse]
    def structured_output_controller_find_all(id: nil, name: nil, page: nil, sort_order: nil, limit: nil,
                                              created_at_gt: nil, created_at_lt: nil, created_at_ge: nil, created_at_le: nil, updated_at_gt: nil, updated_at_lt: nil, updated_at_ge: nil, updated_at_le: nil, request_options: nil)
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
            "name": name,
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
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output"
        end
        Vapi::StructuredOutputPaginatedResponse.from_json(json_object: response.body)
      end
    end

    # @param request [Hash] Request of type Vapi::CreateStructuredOutputDto, as a Hash
    #   * :model (Hash)
    #   * :compliance_plan (Hash)
    #     * :force_store_on_hipaa_enabled (Boolean)
    #   * :name (String)
    #   * :schema (Hash)
    #     * :type (Vapi::JsonSchemaType)
    #     * :items (Hash{String => Object})
    #     * :properties (Hash{String => Object})
    #     * :description (String)
    #     * :pattern (String)
    #     * :format (Vapi::JsonSchemaFormat)
    #     * :required (Array<String>)
    #     * :enum (Array<String>)
    #     * :title (String)
    #   * :description (String)
    #   * :assistant_ids (Array<String>)
    #   * :workflow_ids (Array<String>)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_create(request:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output"
        end
        Vapi::StructuredOutput.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_find_one(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/#{id}"
        end
        Vapi::StructuredOutput.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_remove(id:, request_options: nil)
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
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/#{id}"
        end
        Vapi::StructuredOutput.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param schema_override [String]
    # @param model [Vapi::StructuredOutputs::UpdateStructuredOutputDtoModel] This is the model that will be used to extract the structured output.
    #  To provide your own custom system and user prompts for structured output
    #  extraction, populate the messages array with your system and user messages. You
    #  can specify liquid templating in your system and user messages.
    #  Between the system or user messages, you must reference either 'transcript' or
    #  'messages' with the '{{}}' syntax to access the conversation history.
    #  Between the system or user messages, you must reference a variation of the
    #  structured output with the '{{}}' syntax to access the structured output
    #  definition.
    #  i.e.:
    #  {{structuredOutput}}
    #  {{structuredOutput.name}}
    #  {{structuredOutput.description}}
    #  {{structuredOutput.schema}}
    #  If model is not specified, GPT-4.1 will be used by default for extraction,
    #  utilizing default system and user prompts.
    #  If messages or required fields are not specified, the default system and user
    #  prompts will be used.
    # @param compliance_plan [Hash] Compliance configuration for this output. Only enable overrides if no sensitive
    #  data will be stored.Request of type Vapi::ComplianceOverride, as a Hash
    #   * :force_store_on_hipaa_enabled (Boolean)
    # @param name [String] This is the name of the structured output.
    # @param description [String] This is the description of what the structured output extracts.
    #  Use this to provide context about what data will be extracted and how it will be
    #  used.
    # @param assistant_ids [Array<String>] These are the assistant IDs that this structured output is linked to.
    #  When linked to assistants, this structured output will be available for
    #  extraction during those assistant's calls.
    # @param workflow_ids [Array<String>] These are the workflow IDs that this structured output is linked to.
    #  When linked to workflows, this structured output will be available for
    #  extraction during those workflow's execution.
    # @param schema [Hash] This is the JSON Schema definition for the structured output.
    #  Defines the structure and validation rules for the data that will be extracted.
    #  Supports all JSON Schema features including:
    #  - Objects and nested properties
    #  - Arrays and array validation
    #  - String, number, boolean, and null types
    #  - Enums and const values
    #  - Validation constraints (min/max, patterns, etc.)
    #  - Composition with allOf, anyOf, oneOfRequest of type Vapi::JsonSchema, as a Hash
    #   * :type (Vapi::JsonSchemaType)
    #   * :items (Hash{String => Object})
    #   * :properties (Hash{String => Object})
    #   * :description (String)
    #   * :pattern (String)
    #   * :format (Vapi::JsonSchemaFormat)
    #   * :required (Array<String>)
    #   * :enum (Array<String>)
    #   * :title (String)
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_update(id:, schema_override:, model: nil, compliance_plan: nil, name: nil,
                                            description: nil, assistant_ids: nil, workflow_ids: nil, schema: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
          req.headers = {
        **(req.headers || {}),
        **@request_client.get_headers,
        **(request_options&.additional_headers || {})
          }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "schemaOverride": schema_override
          }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            model: model,
            compliancePlan: compliance_plan,
            name: name,
            description: description,
            assistantIds: assistant_ids,
            workflowIds: workflow_ids,
            schema: schema
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/#{id}"
        end
        Vapi::StructuredOutput.from_json(json_object: response.body)
      end
    end

    # @param preview_enabled [Boolean] This is the preview flag for the re-run. If true, the re-run will be executed
    #  and the response will be returned immediately and the call artifact will NOT be
    #  updated.
    #  If false (default), the re-run will be executed and the response will be updated
    #  in the call artifact.
    # @param structured_output_id [String] This is the ID of the structured output that will be run. This must be provided
    #  unless a transient structured output is provided.
    #  When the re-run is executed, only the value of this structured output will be
    #  replaced with the new value, or added if not present.
    # @param structured_output [Hash] This is the transient structured output that will be run. This must be provided
    #  if a structured output ID is not provided.
    #  When the re-run is executed, the structured output value will be added to the
    #  existing artifact.Request of type Vapi::CreateStructuredOutputDto, as a Hash
    #   * :model (Hash)
    #   * :compliance_plan (Hash)
    #     * :force_store_on_hipaa_enabled (Boolean)
    #   * :name (String)
    #   * :schema (Hash)
    #     * :type (Vapi::JsonSchemaType)
    #     * :items (Hash{String => Object})
    #     * :properties (Hash{String => Object})
    #     * :description (String)
    #     * :pattern (String)
    #     * :format (Vapi::JsonSchemaFormat)
    #     * :required (Array<String>)
    #     * :enum (Array<String>)
    #     * :title (String)
    #   * :description (String)
    #   * :assistant_ids (Array<String>)
    #   * :workflow_ids (Array<String>)
    # @param call_ids [Array<String>] This is the array of callIds that will be updated with the new structured output
    #  value. If preview is true, this array must be provided and contain exactly 1
    #  callId.
    #  If preview is false, up to 100 callIds may be provided.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::StructuredOutput]
    def structured_output_controller_run(call_ids:, preview_enabled: nil, structured_output_id: nil,
                                         structured_output: nil, request_options: nil)
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
            previewEnabled: preview_enabled,
            structuredOutputId: structured_output_id,
            structuredOutput: structured_output,
            callIds: call_ids
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/run"
        end
        Vapi::StructuredOutput.from_json(json_object: response.body)
      end
    end

    # Analyzes assistant configuration and generates contextual structured output
    #  recommendations
    #
    # @param assistant_id [String] The assistant ID to analyze and generate suggestions for
    # @param count [Float] Number of suggestions to generate
    # @param exclude_ids [Array<String>] Existing structured output IDs to exclude from suggestions
    # @param seed [Float] Iteration/seed for generating diverse suggestions (0 = first generation, 1+ =
    #  regenerations with increasing specificity)
    # @param request_options [Vapi::RequestOptions]
    # @return [Array<Hash{String => Object}>]
    def structured_output_controller_suggest(assistant_id:, count: nil, exclude_ids: nil, seed: nil,
                                             request_options: nil)
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
            assistantId: assistant_id,
            count: count,
            excludeIds: exclude_ids,
            seed: seed
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/structured-output/suggest"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
  end
end
