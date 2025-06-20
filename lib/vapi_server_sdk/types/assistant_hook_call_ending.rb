# frozen_string_literal: true
require_relative "assistant_hook_call_ending_do_item"
require_relative "assistant_hook_filter"
require "ostruct"
require "json"

module Vapi
  class AssistantHookCallEnding
  # @return [Array<Vapi::AssistantHookCallEndingDoItem>] This is the set of actions to perform when the hook triggers
    attr_reader :do_
  # @return [Array<Vapi::AssistantHookFilter>] This is the set of filters that must match for the hook to trigger
    attr_reader :filters
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param do_ [Array<Vapi::AssistantHookCallEndingDoItem>] This is the set of actions to perform when the hook triggers
    # @param filters [Array<Vapi::AssistantHookFilter>] This is the set of filters that must match for the hook to trigger
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::AssistantHookCallEnding]
    def initialize(do_:, filters: OMIT, additional_properties: nil)
      @do_ = do_
      @filters = filters if filters != OMIT
      @additional_properties = additional_properties
      @_field_set = { "do": do_, "filters": filters }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AssistantHookCallEnding
    #
    # @param json_object [String] 
    # @return [Vapi::AssistantHookCallEnding]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      do_ = parsed_json["do"]&.map do | item |
  item = item.to_json
  Vapi::AssistantHookCallEndingDoItem.from_json(json_object: item)
end
      filters = parsed_json["filters"]&.map do | item |
  item = item.to_json
  Vapi::AssistantHookFilter.from_json(json_object: item)
end
      new(
        do_: do_,
        filters: filters,
        additional_properties: struct
      )
    end
# Serialize an instance of AssistantHookCallEnding to a JSON object
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
      obj.do_.is_a?(Array) != false || raise("Passed value for field obj.do_ is not the expected type, validation failed.")
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
    end
  end
end