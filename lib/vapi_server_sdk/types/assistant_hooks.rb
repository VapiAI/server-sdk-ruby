# frozen_string_literal: true

require_relative "assistant_hook_filter"
require_relative "assistant_hook_action_base"
require "ostruct"
require "json"

module Vapi
  class AssistantHooks
    # @return [String] This is the event that triggers this hook
    attr_reader :on
    # @return [Array<Vapi::AssistantHookFilter>] This is the set of filters that must match for the hook to trigger
    attr_reader :filters
    # @return [Array<Vapi::AssistantHookActionBase>] This is the set of actions to perform when the hook triggers
    attr_reader :do_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param on [String] This is the event that triggers this hook
    # @param filters [Array<Vapi::AssistantHookFilter>] This is the set of filters that must match for the hook to trigger
    # @param do_ [Array<Vapi::AssistantHookActionBase>] This is the set of actions to perform when the hook triggers
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantHooks]
    def initialize(on:, do_:, filters: OMIT, additional_properties: nil)
      @on = on
      @filters = filters if filters != OMIT
      @do_ = do_
      @additional_properties = additional_properties
      @_field_set = { "on": on, "filters": filters, "do": do_ }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of AssistantHooks
    #
    # @param json_object [String]
    # @return [Vapi::AssistantHooks]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      on = parsed_json["on"]
      filters = parsed_json["filters"]&.map do |item|
        item = item.to_json
        Vapi::AssistantHookFilter.from_json(json_object: item)
      end
      do_ = parsed_json["do"]&.map do |item|
        item = item.to_json
        Vapi::AssistantHookActionBase.from_json(json_object: item)
      end
      new(
        on: on,
        filters: filters,
        do_: do_,
        additional_properties: struct
      )
    end

    # Serialize an instance of AssistantHooks to a JSON object
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
      obj.on.is_a?(String) != false || raise("Passed value for field obj.on is not the expected type, validation failed.")
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      obj.do_.is_a?(Array) != false || raise("Passed value for field obj.do_ is not the expected type, validation failed.")
    end
  end
end
