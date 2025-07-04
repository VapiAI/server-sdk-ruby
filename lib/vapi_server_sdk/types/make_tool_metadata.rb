# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class MakeToolMetadata
    # @return [Float]
    attr_reader :scenario_id
    # @return [Float]
    attr_reader :trigger_hook_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param scenario_id [Float]
    # @param trigger_hook_id [Float]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::MakeToolMetadata]
    def initialize(scenario_id: OMIT, trigger_hook_id: OMIT, additional_properties: nil)
      @scenario_id = scenario_id if scenario_id != OMIT
      @trigger_hook_id = trigger_hook_id if trigger_hook_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "scenarioId": scenario_id, "triggerHookId": trigger_hook_id }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MakeToolMetadata
    #
    # @param json_object [String]
    # @return [Vapi::MakeToolMetadata]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      scenario_id = parsed_json["scenarioId"]
      trigger_hook_id = parsed_json["triggerHookId"]
      new(
        scenario_id: scenario_id,
        trigger_hook_id: trigger_hook_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of MakeToolMetadata to a JSON object
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
      obj.scenario_id&.is_a?(Float) != false || raise("Passed value for field obj.scenario_id is not the expected type, validation failed.")
      obj.trigger_hook_id&.is_a?(Float) != false || raise("Passed value for field obj.trigger_hook_id is not the expected type, validation failed.")
    end
  end
end
