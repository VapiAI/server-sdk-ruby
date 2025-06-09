# frozen_string_literal: true
require_relative "tool_template_setup"
require "ostruct"
require "json"

module Vapi
  class GoHighLevelCalendarEventCreateToolProviderDetails
  # @return [String] This is the Template URL or the Snapshot URL corresponding to the Template.
    attr_reader :template_url
  # @return [Array<Vapi::ToolTemplateSetup>] 
    attr_reader :setup_instructions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param template_url [String] This is the Template URL or the Snapshot URL corresponding to the Template.
    # @param setup_instructions [Array<Vapi::ToolTemplateSetup>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GoHighLevelCalendarEventCreateToolProviderDetails]
    def initialize(template_url: OMIT, setup_instructions: OMIT, additional_properties: nil)
      @template_url = template_url if template_url != OMIT
      @setup_instructions = setup_instructions if setup_instructions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "templateUrl": template_url, "setupInstructions": setup_instructions }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  GoHighLevelCalendarEventCreateToolProviderDetails
    #
    # @param json_object [String] 
    # @return [Vapi::GoHighLevelCalendarEventCreateToolProviderDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      template_url = parsed_json["templateUrl"]
      setup_instructions = parsed_json["setupInstructions"]&.map do | item |
  item = item.to_json
  Vapi::ToolTemplateSetup.from_json(json_object: item)
end
      new(
        template_url: template_url,
        setup_instructions: setup_instructions,
        additional_properties: struct
      )
    end
# Serialize an instance of GoHighLevelCalendarEventCreateToolProviderDetails to a
#  JSON object
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
      obj.template_url&.is_a?(String) != false || raise("Passed value for field obj.template_url is not the expected type, validation failed.")
      obj.setup_instructions&.is_a?(Array) != false || raise("Passed value for field obj.setup_instructions is not the expected type, validation failed.")
    end
  end
end