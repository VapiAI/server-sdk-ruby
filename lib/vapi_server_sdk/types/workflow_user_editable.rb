# frozen_string_literal: true
require_relative "workflow_user_editable_nodes_item"
require_relative "workflow_user_editable_model"
require_relative "edge"
require "ostruct"
require "json"

module Vapi
  class WorkflowUserEditable
  # @return [Array<Vapi::WorkflowUserEditableNodesItem>] 
    attr_reader :nodes
  # @return [Vapi::WorkflowUserEditableModel] 
    attr_reader :model
  # @return [String] 
    attr_reader :name
  # @return [Array<Vapi::Edge>] 
    attr_reader :edges
  # @return [String] 
    attr_reader :global_prompt
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param nodes [Array<Vapi::WorkflowUserEditableNodesItem>] 
    # @param model [Vapi::WorkflowUserEditableModel] 
    # @param name [String] 
    # @param edges [Array<Vapi::Edge>] 
    # @param global_prompt [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WorkflowUserEditable]
    def initialize(nodes:, model: OMIT, name:, edges:, global_prompt: OMIT, additional_properties: nil)
      @nodes = nodes
      @model = model if model != OMIT
      @name = name
      @edges = edges
      @global_prompt = global_prompt if global_prompt != OMIT
      @additional_properties = additional_properties
      @_field_set = { "nodes": nodes, "model": model, "name": name, "edges": edges, "globalPrompt": global_prompt }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowUserEditable
    #
    # @param json_object [String] 
    # @return [Vapi::WorkflowUserEditable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      nodes = parsed_json["nodes"]&.map do | item |
  item = item.to_json
  Vapi::WorkflowUserEditableNodesItem.from_json(json_object: item)
end
      unless parsed_json["model"].nil?
        model = parsed_json["model"].to_json
        model = Vapi::WorkflowUserEditableModel.from_json(json_object: model)
      else
        model = nil
      end
      name = parsed_json["name"]
      edges = parsed_json["edges"]&.map do | item |
  item = item.to_json
  Vapi::Edge.from_json(json_object: item)
end
      global_prompt = parsed_json["globalPrompt"]
      new(
        nodes: nodes,
        model: model,
        name: name,
        edges: edges,
        global_prompt: global_prompt,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowUserEditable to a JSON object
    #
    # @return [String]
    def to_json
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
      obj.model.nil? || Vapi::WorkflowUserEditableModel.validate_raw(obj: obj.model)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.edges.is_a?(Array) != false || raise("Passed value for field obj.edges is not the expected type, validation failed.")
      obj.global_prompt&.is_a?(String) != false || raise("Passed value for field obj.global_prompt is not the expected type, validation failed.")
    end
  end
end