# frozen_string_literal: true
require_relative "workflow_nodes_item"
require_relative "workflow_model"
require "date"
require "date"
require_relative "edge"
require "ostruct"
require "json"

module Vapi
  class Workflow
  # @return [Array<Vapi::WorkflowNodesItem>] 
    attr_reader :nodes
  # @return [Vapi::WorkflowModel] 
    attr_reader :model
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :org_id
  # @return [DateTime] 
    attr_reader :created_at
  # @return [DateTime] 
    attr_reader :updated_at
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

    # @param nodes [Array<Vapi::WorkflowNodesItem>] 
    # @param model [Vapi::WorkflowModel] 
    # @param id [String] 
    # @param org_id [String] 
    # @param created_at [DateTime] 
    # @param updated_at [DateTime] 
    # @param name [String] 
    # @param edges [Array<Vapi::Edge>] 
    # @param global_prompt [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Workflow]
    def initialize(nodes:, model: OMIT, id:, org_id:, created_at:, updated_at:, name:, edges:, global_prompt: OMIT, additional_properties: nil)
      @nodes = nodes
      @model = model if model != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name
      @edges = edges
      @global_prompt = global_prompt if global_prompt != OMIT
      @additional_properties = additional_properties
      @_field_set = { "nodes": nodes, "model": model, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at, "name": name, "edges": edges, "globalPrompt": global_prompt }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Workflow
    #
    # @param json_object [String] 
    # @return [Vapi::Workflow]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      nodes = parsed_json["nodes"]&.map do | item |
  item = item.to_json
  Vapi::WorkflowNodesItem.from_json(json_object: item)
end
      unless parsed_json["model"].nil?
        model = parsed_json["model"].to_json
        model = Vapi::WorkflowModel.from_json(json_object: model)
      else
        model = nil
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
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
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        edges: edges,
        global_prompt: global_prompt,
        additional_properties: struct
      )
    end
# Serialize an instance of Workflow to a JSON object
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
      obj.model.nil? || Vapi::WorkflowModel.validate_raw(obj: obj.model)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.edges.is_a?(Array) != false || raise("Passed value for field obj.edges is not the expected type, validation failed.")
      obj.global_prompt&.is_a?(String) != false || raise("Passed value for field obj.global_prompt is not the expected type, validation failed.")
    end
  end
end