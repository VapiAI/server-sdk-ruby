# frozen_string_literal: true

require_relative "tool_template_setup"
require "ostruct"
require "json"

module Vapi
  class MakeToolProviderDetails
    # @return [String] This is the Template URL or the Snapshot URL corresponding to the Template.
    attr_reader :template_url
    # @return [Array<Vapi::ToolTemplateSetup>]
    attr_reader :setup_instructions
    # @return [String] The type of tool. "make" for Make tool.
    attr_reader :type
    # @return [Float]
    attr_reader :scenario_id
    # @return [String]
    attr_reader :scenario_name
    # @return [Float]
    attr_reader :trigger_hook_id
    # @return [String]
    attr_reader :trigger_hook_name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param template_url [String] This is the Template URL or the Snapshot URL corresponding to the Template.
    # @param setup_instructions [Array<Vapi::ToolTemplateSetup>]
    # @param type [String] The type of tool. "make" for Make tool.
    # @param scenario_id [Float]
    # @param scenario_name [String]
    # @param trigger_hook_id [Float]
    # @param trigger_hook_name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::MakeToolProviderDetails]
    def initialize(type:, template_url: OMIT, setup_instructions: OMIT, scenario_id: OMIT, scenario_name: OMIT,
                   trigger_hook_id: OMIT, trigger_hook_name: OMIT, additional_properties: nil)
      @template_url = template_url if template_url != OMIT
      @setup_instructions = setup_instructions if setup_instructions != OMIT
      @type = type
      @scenario_id = scenario_id if scenario_id != OMIT
      @scenario_name = scenario_name if scenario_name != OMIT
      @trigger_hook_id = trigger_hook_id if trigger_hook_id != OMIT
      @trigger_hook_name = trigger_hook_name if trigger_hook_name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "templateUrl": template_url,
        "setupInstructions": setup_instructions,
        "type": type,
        "scenarioId": scenario_id,
        "scenarioName": scenario_name,
        "triggerHookId": trigger_hook_id,
        "triggerHookName": trigger_hook_name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of MakeToolProviderDetails
    #
    # @param json_object [String]
    # @return [Vapi::MakeToolProviderDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      template_url = parsed_json["templateUrl"]
      setup_instructions = parsed_json["setupInstructions"]&.map do |item|
        item = item.to_json
        Vapi::ToolTemplateSetup.from_json(json_object: item)
      end
      type = parsed_json["type"]
      scenario_id = parsed_json["scenarioId"]
      scenario_name = parsed_json["scenarioName"]
      trigger_hook_id = parsed_json["triggerHookId"]
      trigger_hook_name = parsed_json["triggerHookName"]
      new(
        template_url: template_url,
        setup_instructions: setup_instructions,
        type: type,
        scenario_id: scenario_id,
        scenario_name: scenario_name,
        trigger_hook_id: trigger_hook_id,
        trigger_hook_name: trigger_hook_name,
        additional_properties: struct
      )
    end

    # Serialize an instance of MakeToolProviderDetails to a JSON object
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
      obj.template_url&.is_a?(String) != false || raise("Passed value for field obj.template_url is not the expected type, validation failed.")
      obj.setup_instructions&.is_a?(Array) != false || raise("Passed value for field obj.setup_instructions is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.scenario_id&.is_a?(Float) != false || raise("Passed value for field obj.scenario_id is not the expected type, validation failed.")
      obj.scenario_name&.is_a?(String) != false || raise("Passed value for field obj.scenario_name is not the expected type, validation failed.")
      obj.trigger_hook_id&.is_a?(Float) != false || raise("Passed value for field obj.trigger_hook_id is not the expected type, validation failed.")
      obj.trigger_hook_name&.is_a?(String) != false || raise("Passed value for field obj.trigger_hook_name is not the expected type, validation failed.")
    end
  end
end
