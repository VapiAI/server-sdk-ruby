# frozen_string_literal: true

require_relative "workflow_nodes_item"
require "date"
require_relative "edge"
require "ostruct"
require "json"

module Vapi
  class Workflow
    # @return [String]
    attr_reader :type
    # @return [Array<Vapi::WorkflowNodesItem>]
    attr_reader :nodes
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
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String]
    # @param nodes [Array<Vapi::WorkflowNodesItem>]
    # @param id [String]
    # @param org_id [String]
    # @param created_at [DateTime]
    # @param updated_at [DateTime]
    # @param name [String]
    # @param edges [Array<Vapi::Edge>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Workflow]
    def initialize(type:, nodes:, id:, org_id:, created_at:, updated_at:, name:, edges:, additional_properties: nil)
      @type = type
      @nodes = nodes
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @name = name
      @edges = edges
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "nodes": nodes,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "name": name,
        "edges": edges
      }
    end

    # Deserialize a JSON object to an instance of Workflow
    #
    # @param json_object [String]
    # @return [Vapi::Workflow]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      nodes = parsed_json["nodes"]&.map do |item|
        item = item.to_json
        Vapi::WorkflowNodesItem.from_json(json_object: item)
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      name = parsed_json["name"]
      edges = parsed_json["edges"]&.map do |item|
        item = item.to_json
        Vapi::Edge.from_json(json_object: item)
      end
      new(
        type: type,
        nodes: nodes,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        name: name,
        edges: edges,
        additional_properties: struct
      )
    end

    # Serialize an instance of Workflow to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.nodes.is_a?(Array) != false || raise("Passed value for field obj.nodes is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.edges.is_a?(Array) != false || raise("Passed value for field obj.edges is not the expected type, validation failed.")
    end
  end
end
