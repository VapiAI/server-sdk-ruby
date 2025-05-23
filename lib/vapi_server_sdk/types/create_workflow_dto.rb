# frozen_string_literal: true

require_relative "create_workflow_dto_nodes_item"
require_relative "create_workflow_dto_model"
require_relative "edge"
require "ostruct"
require "json"

module Vapi
  class CreateWorkflowDto
    # @return [Array<Vapi::CreateWorkflowDtoNodesItem>]
    attr_reader :nodes
    # @return [Vapi::CreateWorkflowDtoModel] These are the options for the workflow's LLM.
    attr_reader :model
    # @return [String]
    attr_reader :name
    # @return [Array<Vapi::Edge>]
    attr_reader :edges
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param nodes [Array<Vapi::CreateWorkflowDtoNodesItem>]
    # @param model [Vapi::CreateWorkflowDtoModel] These are the options for the workflow's LLM.
    # @param name [String]
    # @param edges [Array<Vapi::Edge>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWorkflowDto]
    def initialize(nodes:, name:, edges:, model: OMIT, additional_properties: nil)
      @nodes = nodes
      @model = model if model != OMIT
      @name = name
      @edges = edges
      @additional_properties = additional_properties
      @_field_set = { "nodes": nodes, "model": model, "name": name, "edges": edges }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateWorkflowDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateWorkflowDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      nodes = parsed_json["nodes"]&.map do |item|
        item = item.to_json
        Vapi::CreateWorkflowDtoNodesItem.from_json(json_object: item)
      end
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::CreateWorkflowDtoModel.from_json(json_object: model)
      end
      name = parsed_json["name"]
      edges = parsed_json["edges"]&.map do |item|
        item = item.to_json
        Vapi::Edge.from_json(json_object: item)
      end
      new(
        nodes: nodes,
        model: model,
        name: name,
        edges: edges,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateWorkflowDto to a JSON object
    #
    # @return [String]
    def to_json(*_args)
      @_field_set&.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given
    #  hash and check each fields type against the current object's property
    #  definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.nodes.is_a?(Array) != false || raise("Passed value for field obj.nodes is not the expected type, validation failed.")
      obj.model.nil? || Vapi::CreateWorkflowDtoModel.validate_raw(obj: obj.model)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.edges.is_a?(Array) != false || raise("Passed value for field obj.edges is not the expected type, validation failed.")
    end
  end
end
