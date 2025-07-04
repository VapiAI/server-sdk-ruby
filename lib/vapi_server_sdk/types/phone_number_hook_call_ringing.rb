# frozen_string_literal: true

require_relative "phone_number_hook_call_ringing_do_item"
require "ostruct"
require "json"

module Vapi
  class PhoneNumberHookCallRinging
    # @return [String] This is the event to trigger the hook on
    attr_reader :on
    # @return [Array<Vapi::PhoneNumberHookCallRingingDoItem>] This is the set of actions to perform when the hook triggers
    attr_reader :do_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param on [String] This is the event to trigger the hook on
    # @param do_ [Array<Vapi::PhoneNumberHookCallRingingDoItem>] This is the set of actions to perform when the hook triggers
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PhoneNumberHookCallRinging]
    def initialize(on:, do_:, additional_properties: nil)
      @on = on
      @do_ = do_
      @additional_properties = additional_properties
      @_field_set = { "on": on, "do": do_ }
    end

    # Deserialize a JSON object to an instance of PhoneNumberHookCallRinging
    #
    # @param json_object [String]
    # @return [Vapi::PhoneNumberHookCallRinging]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      on = parsed_json["on"]
      do_ = parsed_json["do"]&.map do |item|
        item = item.to_json
        Vapi::PhoneNumberHookCallRingingDoItem.from_json(json_object: item)
      end
      new(
        on: on,
        do_: do_,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberHookCallRinging to a JSON object
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
      obj.do_.is_a?(Array) != false || raise("Passed value for field obj.do_ is not the expected type, validation failed.")
    end
  end
end
