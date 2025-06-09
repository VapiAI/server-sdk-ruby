# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow"
require "json"
require_relative "../types/create_workflow_dto"
require_relative "types/update_workflow_dto_nodes_item"
require_relative "types/update_workflow_dto_model"
require_relative "../types/edge"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vapi
  class WorkflowClient
  # @return [Vapi::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vapi::RequestClient] 
    # @return [Vapi::WorkflowClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Vapi::RequestOptions] 
    # @return [Array<Vapi::Workflow>]
    def workflow_controller_find_all(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
end
      parsed_json = JSON.parse(response.body)
      parsed_json&.map do | item |
        item = item.to_json
        Vapi::Workflow.from_json(json_object: item)
      end
    end
    # @param request [Hash] Request of type Vapi::CreateWorkflowDto, as a Hash
    #   * :nodes (Array<Vapi::CreateWorkflowDtoNodesItem>) 
    #   * :model (Hash)
    #   * :name (String) 
    #   * :edges (Array<Vapi::Edge>) 
    #   * :global_prompt (String) 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_create(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
end
      Vapi::Workflow.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_find_one(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
end
      Vapi::Workflow.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_delete(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
end
      Vapi::Workflow.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param nodes [Array<Hash>] Request of type Array<Vapi::Workflow::UpdateWorkflowDtoNodesItem>, as a Hash
    # @param model [Vapi::Workflow::UpdateWorkflowDtoModel] 
    # @param name [String] 
    # @param edges [Array<Hash>] Request of type Array<Vapi::Edge>, as a Hash
    #   * :condition (Hash)
    #   * :from (String) 
    #   * :to (String) 
    #   * :metadata (Hash{String => Object}) 
    # @param global_prompt [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_update(id:, nodes: nil, model: nil, name: nil, edges: nil, global_prompt: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), nodes: nodes, model: model, name: name, edges: edges, globalPrompt: global_prompt }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
end
      Vapi::Workflow.from_json(json_object: response.body)
    end
  end
  class AsyncWorkflowClient
  # @return [Vapi::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vapi::RequestClient] 
    # @return [Vapi::AsyncWorkflowClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param request_options [Vapi::RequestOptions] 
    # @return [Array<Vapi::Workflow>]
    def workflow_controller_find_all(request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
end
        parsed_json = JSON.parse(response.body)
        parsed_json&.map do | item |
          item = item.to_json
          Vapi::Workflow.from_json(json_object: item)
        end
      end
    end
    # @param request [Hash] Request of type Vapi::CreateWorkflowDto, as a Hash
    #   * :nodes (Array<Vapi::CreateWorkflowDtoNodesItem>) 
    #   * :model (Hash)
    #   * :name (String) 
    #   * :edges (Array<Vapi::Edge>) 
    #   * :global_prompt (String) 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_create(request:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow"
end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_find_one(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_delete(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param nodes [Array<Hash>] Request of type Array<Vapi::Workflow::UpdateWorkflowDtoNodesItem>, as a Hash
    # @param model [Vapi::Workflow::UpdateWorkflowDtoModel] 
    # @param name [String] 
    # @param edges [Array<Hash>] Request of type Array<Vapi::Edge>, as a Hash
    #   * :condition (Hash)
    #   * :from (String) 
    #   * :to (String) 
    #   * :metadata (Hash{String => Object}) 
    # @param global_prompt [String] 
    # @param request_options [Vapi::RequestOptions] 
    # @return [Vapi::Workflow]
    def workflow_controller_update(id:, nodes: nil, model: nil, name: nil, edges: nil, global_prompt: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), nodes: nodes, model: model, name: name, edges: edges, globalPrompt: global_prompt }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/workflow/#{id}"
end
        Vapi::Workflow.from_json(json_object: response.body)
      end
    end
  end
end