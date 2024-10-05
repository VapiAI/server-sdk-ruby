# frozen_string_literal: true

require_relative "tool_template_setup"
require "ostruct"
require "json"

module Vapi
  class GhlToolProviderDetails
    # @return [String] This is the Template URL or the Snapshot URL corresponding to the Template.
    attr_reader :template_url
    # @return [Array<Vapi::ToolTemplateSetup>]
    attr_reader :setup_instructions
    # @return [String] The type of tool. "ghl" for GHL tool.
    attr_reader :type
    # @return [String]
    attr_reader :workflow_id
    # @return [String]
    attr_reader :workflow_name
    # @return [String]
    attr_reader :webhook_hook_id
    # @return [String]
    attr_reader :webhook_hook_name
    # @return [String]
    attr_reader :location_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param template_url [String] This is the Template URL or the Snapshot URL corresponding to the Template.
    # @param setup_instructions [Array<Vapi::ToolTemplateSetup>]
    # @param type [String] The type of tool. "ghl" for GHL tool.
    # @param workflow_id [String]
    # @param workflow_name [String]
    # @param webhook_hook_id [String]
    # @param webhook_hook_name [String]
    # @param location_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GhlToolProviderDetails]
    def initialize(type:, template_url: OMIT, setup_instructions: OMIT, workflow_id: OMIT, workflow_name: OMIT,
                   webhook_hook_id: OMIT, webhook_hook_name: OMIT, location_id: OMIT, additional_properties: nil)
      @template_url = template_url if template_url != OMIT
      @setup_instructions = setup_instructions if setup_instructions != OMIT
      @type = type
      @workflow_id = workflow_id if workflow_id != OMIT
      @workflow_name = workflow_name if workflow_name != OMIT
      @webhook_hook_id = webhook_hook_id if webhook_hook_id != OMIT
      @webhook_hook_name = webhook_hook_name if webhook_hook_name != OMIT
      @location_id = location_id if location_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "templateUrl": template_url,
        "setupInstructions": setup_instructions,
        "type": type,
        "workflowId": workflow_id,
        "workflowName": workflow_name,
        "webhookHookId": webhook_hook_id,
        "webhookHookName": webhook_hook_name,
        "locationId": location_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GhlToolProviderDetails
    #
    # @param json_object [String]
    # @return [Vapi::GhlToolProviderDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      template_url = parsed_json["templateUrl"]
      setup_instructions = parsed_json["setupInstructions"]&.map do |item|
        item = item.to_json
        Vapi::ToolTemplateSetup.from_json(json_object: item)
      end
      type = parsed_json["type"]
      workflow_id = parsed_json["workflowId"]
      workflow_name = parsed_json["workflowName"]
      webhook_hook_id = parsed_json["webhookHookId"]
      webhook_hook_name = parsed_json["webhookHookName"]
      location_id = parsed_json["locationId"]
      new(
        template_url: template_url,
        setup_instructions: setup_instructions,
        type: type,
        workflow_id: workflow_id,
        workflow_name: workflow_name,
        webhook_hook_id: webhook_hook_id,
        webhook_hook_name: webhook_hook_name,
        location_id: location_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of GhlToolProviderDetails to a JSON object
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
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.workflow_name&.is_a?(String) != false || raise("Passed value for field obj.workflow_name is not the expected type, validation failed.")
      obj.webhook_hook_id&.is_a?(String) != false || raise("Passed value for field obj.webhook_hook_id is not the expected type, validation failed.")
      obj.webhook_hook_name&.is_a?(String) != false || raise("Passed value for field obj.webhook_hook_name is not the expected type, validation failed.")
      obj.location_id&.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
    end
  end
end
