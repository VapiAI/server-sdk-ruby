# frozen_string_literal: true

require_relative "hook_on"
require_relative "say_hook"
require "ostruct"
require "json"

module Vapi
  class Hook
    # @return [Vapi::HookOn]
    attr_reader :on
    # @return [Array<Vapi::SayHook>]
    attr_reader :do_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param on [Vapi::HookOn]
    # @param do_ [Array<Vapi::SayHook>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Hook]
    def initialize(on:, do_:, additional_properties: nil)
      @on = on
      @do_ = do_
      @additional_properties = additional_properties
      @_field_set = { "on": on, "do": do_ }
    end

    # Deserialize a JSON object to an instance of Hook
    #
    # @param json_object [String]
    # @return [Vapi::Hook]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      on = parsed_json["on"]
      do_ = parsed_json["do"]&.map do |item|
        item = item.to_json
        Vapi::SayHook.from_json(json_object: item)
      end
      new(
        on: on,
        do_: do_,
        additional_properties: struct
      )
    end

    # Serialize an instance of Hook to a JSON object
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
      obj.on.is_a?(Vapi::HookOn) != false || raise("Passed value for field obj.on is not the expected type, validation failed.")
      obj.do_.is_a?(Array) != false || raise("Passed value for field obj.do_ is not the expected type, validation failed.")
    end
  end
end
