# frozen_string_literal: true

require_relative "../../requests"
require "date"
require_relative "types/blocks_list_response_item"
require "json"
require_relative "types/blocks_create_request"
require_relative "types/blocks_create_response"
require_relative "types/blocks_get_response"
require_relative "types/blocks_delete_response"
require_relative "types/update_block_dto_messages_item"
require_relative "../types/json_schema"
require_relative "types/update_block_dto_tool"
require_relative "types/update_block_dto_steps_item"
require_relative "types/blocks_update_response"
require "async"

module Vapi
  class BlocksClient
    # @return [Vapi::RequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::RequestClient]
    # @return [Vapi::BlocksClient]
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
    # @return [Array<Vapi::Blocks::BlocksListResponseItem>]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.list
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
        req.url "#{@request_client.get_url(request_options: request_options)}/block"
      end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do |item|
        item = item.to_json
        Vapi::Blocks::BlocksListResponseItem.from_json(json_object: item)
      end
    end

    # @param request [Vapi::Blocks::BlocksCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksCreateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.create
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
        req.url "#{@request_client.get_url(request_options: request_options)}/block"
      end
      Vapi::Blocks::BlocksCreateResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksGetResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.get(id: "id")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/block/#{id}"
      end
      Vapi::Blocks::BlocksGetResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksDeleteResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.delete(id: "id")
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
        req.url "#{@request_client.get_url(request_options: request_options)}/block/#{id}"
      end
      Vapi::Blocks::BlocksDeleteResponse.from_json(json_object: response.body)
    end

    # @param id [String]
    # @param messages [Array<Hash>] These are the pre-configured messages that will be spoken to the user while the
    #  block is running.Request of type Array<Vapi::Blocks::UpdateBlockDtoMessagesItem>, as a Hash
    # @param input_schema [Hash] This is the input schema for the block. This is the input the block needs to
    #  run. It's given to the block as `steps[0].input`
    #  These are accessible as variables:
    #  - ({{input.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.input.propertyName}}) in context of the workflowRequest of type Vapi::JsonSchema, as a Hash
    #   * :type (Vapi::JsonSchemaType)
    #   * :items (Hash{String => Object})
    #   * :properties (Hash{String => Object})
    #   * :description (String)
    #   * :required (Array<String>)
    # @param output_schema [Hash] This is the output schema for the block. This is the output the block will
    #  return to the workflow (`{{stepName.output}}`).
    #  These are accessible as variables:
    #  - ({{output.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.output.propertyName}}) in context of the workflow (read caveat #1)
    #  - ({{blockName.output.propertyName}}) in context of the workflow (read caveat
    #  #2)
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow with steps.Request of type Vapi::JsonSchema, as a Hash
    #   * :type (Vapi::JsonSchemaType)
    #   * :items (Hash{String => Object})
    #   * :properties (Hash{String => Object})
    #   * :description (String)
    #   * :required (Array<String>)
    # @param tool [Vapi::Blocks::UpdateBlockDtoTool] This is the tool that the block will call. To use an existing tool, use
    #  `toolId`.
    # @param steps [Array<Hash>] These are the steps in the workflow.Request of type Array<Vapi::Blocks::UpdateBlockDtoStepsItem>, as a Hash
    # @param name [String] This is the name of the block. This is just for your reference.
    # @param instruction [String] This is the instruction to the model.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{input.your-property-name}}" for the current step's input
    #  - "{{your-step-name.output.your-property-name}}" for another step's output (in
    #  the same workflow; read caveat #1)
    #  - "{{your-step-name.input.your-property-name}}" for another step's input (in the
    #  same workflow; read caveat #1)
    #  - "{{your-block-name.output.your-property-name}}" for another block's output (in
    #  the same workflow; read caveat #2)
    #  - "{{your-block-name.input.your-property-name}}" for another block's input (in
    #  the same workflow; read caveat #2)
    #  - "{{workflow.input.your-property-name}}" for the current workflow's input
    #  - "{{global.your-property-name}}" for the global context
    #  This can be as simple or as complex as you want it to be.
    #  - "say hello and ask the user about their day!"
    #  - "collect the user's first and last name"
    #  - "user is {{input.firstName}} {{input.lastName}}. their age is {{input.age}}.
    #  ask them about their salary and if they might be interested in buying a house.
    #  we offer {{input.offer}}"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output/input.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output/input.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    # @param tool_id [String] This is the id of the tool that the block will call. To use a transient tool,
    #  use `tool`.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksUpdateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.update(id: "id")
    def update(id:, messages: nil, input_schema: nil, output_schema: nil, tool: nil, steps: nil, name: nil,
               instruction: nil, tool_id: nil, request_options: nil)
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
          messages: messages,
          inputSchema: input_schema,
          outputSchema: output_schema,
          tool: tool,
          steps: steps,
          name: name,
          instruction: instruction,
          toolId: tool_id
        }.compact
        req.url "#{@request_client.get_url(request_options: request_options)}/block/#{id}"
      end
      Vapi::Blocks::BlocksUpdateResponse.from_json(json_object: response.body)
    end
  end

  class AsyncBlocksClient
    # @return [Vapi::AsyncRequestClient]
    attr_reader :request_client

    # @param request_client [Vapi::AsyncRequestClient]
    # @return [Vapi::AsyncBlocksClient]
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
    # @return [Array<Vapi::Blocks::BlocksListResponseItem>]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.list
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
          req.url "#{@request_client.get_url(request_options: request_options)}/block"
        end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do |item|
          item = item.to_json
          Vapi::Blocks::BlocksListResponseItem.from_json(json_object: item)
        end
      end
    end

    # @param request [Vapi::Blocks::BlocksCreateRequest]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksCreateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.create
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
          req.url "#{@request_client.get_url(request_options: request_options)}/block"
        end
        Vapi::Blocks::BlocksCreateResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksGetResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.get(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/block/#{id}"
        end
        Vapi::Blocks::BlocksGetResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksDeleteResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.delete(id: "id")
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
          req.url "#{@request_client.get_url(request_options: request_options)}/block/#{id}"
        end
        Vapi::Blocks::BlocksDeleteResponse.from_json(json_object: response.body)
      end
    end

    # @param id [String]
    # @param messages [Array<Hash>] These are the pre-configured messages that will be spoken to the user while the
    #  block is running.Request of type Array<Vapi::Blocks::UpdateBlockDtoMessagesItem>, as a Hash
    # @param input_schema [Hash] This is the input schema for the block. This is the input the block needs to
    #  run. It's given to the block as `steps[0].input`
    #  These are accessible as variables:
    #  - ({{input.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.input.propertyName}}) in context of the workflowRequest of type Vapi::JsonSchema, as a Hash
    #   * :type (Vapi::JsonSchemaType)
    #   * :items (Hash{String => Object})
    #   * :properties (Hash{String => Object})
    #   * :description (String)
    #   * :required (Array<String>)
    # @param output_schema [Hash] This is the output schema for the block. This is the output the block will
    #  return to the workflow (`{{stepName.output}}`).
    #  These are accessible as variables:
    #  - ({{output.propertyName}}) in context of the block execution (step)
    #  - ({{stepName.output.propertyName}}) in context of the workflow (read caveat #1)
    #  - ({{blockName.output.propertyName}}) in context of the workflow (read caveat
    #  #2)
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output.propertyName}} will reference the latest usage of
    #  the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output.propertyName}} will reference the latest usage of the block.
    #  this liquid variable is just provided for convenience when creating blocks
    #  outside of a workflow with steps.Request of type Vapi::JsonSchema, as a Hash
    #   * :type (Vapi::JsonSchemaType)
    #   * :items (Hash{String => Object})
    #   * :properties (Hash{String => Object})
    #   * :description (String)
    #   * :required (Array<String>)
    # @param tool [Vapi::Blocks::UpdateBlockDtoTool] This is the tool that the block will call. To use an existing tool, use
    #  `toolId`.
    # @param steps [Array<Hash>] These are the steps in the workflow.Request of type Array<Vapi::Blocks::UpdateBlockDtoStepsItem>, as a Hash
    # @param name [String] This is the name of the block. This is just for your reference.
    # @param instruction [String] This is the instruction to the model.
    #  You can reference any variable in the context of the current block execution
    #  (step):
    #  - "{{input.your-property-name}}" for the current step's input
    #  - "{{your-step-name.output.your-property-name}}" for another step's output (in
    #  the same workflow; read caveat #1)
    #  - "{{your-step-name.input.your-property-name}}" for another step's input (in the
    #  same workflow; read caveat #1)
    #  - "{{your-block-name.output.your-property-name}}" for another block's output (in
    #  the same workflow; read caveat #2)
    #  - "{{your-block-name.input.your-property-name}}" for another block's input (in
    #  the same workflow; read caveat #2)
    #  - "{{workflow.input.your-property-name}}" for the current workflow's input
    #  - "{{global.your-property-name}}" for the global context
    #  This can be as simple or as complex as you want it to be.
    #  - "say hello and ask the user about their day!"
    #  - "collect the user's first and last name"
    #  - "user is {{input.firstName}} {{input.lastName}}. their age is {{input.age}}.
    #  ask them about their salary and if they might be interested in buying a house.
    #  we offer {{input.offer}}"
    #  Caveats:
    #  1. a workflow can execute a step multiple times. example, if a loop is used in
    #  the graph. {{stepName.output/input.propertyName}} will reference the latest
    #  usage of the step.
    #  2. a workflow can execute a block multiple times. example, if a step is called
    #  multiple times or if a block is used in multiple steps.
    #  {{blockName.output/input.propertyName}} will reference the latest usage of the
    #  block. this liquid variable is just provided for convenience when creating
    #  blocks outside of a workflow with steps.
    # @param tool_id [String] This is the id of the tool that the block will call. To use a transient tool,
    #  use `tool`.
    # @param request_options [Vapi::RequestOptions]
    # @return [Vapi::Blocks::BlocksUpdateResponse]
    # @example
    #  api = Vapi::Client.new(
    #    base_url: "https://api.example.com",
    #    environment: Vapi::Environment::DEFAULT,
    #    token: "YOUR_AUTH_TOKEN"
    #  )
    #  api.blocks.update(id: "id")
    def update(id:, messages: nil, input_schema: nil, output_schema: nil, tool: nil, steps: nil, name: nil,
               instruction: nil, tool_id: nil, request_options: nil)
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
            messages: messages,
            inputSchema: input_schema,
            outputSchema: output_schema,
            tool: tool,
            steps: steps,
            name: name,
            instruction: instruction,
            toolId: tool_id
          }.compact
          req.url "#{@request_client.get_url(request_options: request_options)}/block/#{id}"
        end
        Vapi::Blocks::BlocksUpdateResponse.from_json(json_object: response.body)
      end
    end
  end
end
