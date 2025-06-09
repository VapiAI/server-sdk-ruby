# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class GhlToolMetadata
  # @return [String] 
    attr_reader :workflow_id
  # @return [String] 
    attr_reader :location_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_id [String] 
    # @param location_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GhlToolMetadata]
    def initialize(workflow_id: OMIT, location_id: OMIT, additional_properties: nil)
      @workflow_id = workflow_id if workflow_id != OMIT
      @location_id = location_id if location_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "workflowId": workflow_id, "locationId": location_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GhlToolMetadata
    #
    # @param json_object [String] 
    # @return [Vapi::GhlToolMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      workflow_id = parsed_json["workflowId"]
      location_id = parsed_json["locationId"]
      new(
        workflow_id: workflow_id,
        location_id: location_id,
        additional_properties: struct
      )
    end
# Serialize an instance of GhlToolMetadata to a JSON object
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
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end