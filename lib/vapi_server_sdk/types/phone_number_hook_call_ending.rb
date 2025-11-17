# frozen_string_literal: true

require_relative "phone_number_call_ending_hook_filter"
require_relative "phone_number_hook_call_ending_do"
require "ostruct"
require "json"

module Vapi
  class PhoneNumberHookCallEnding
    # @return [Array<Vapi::PhoneNumberCallEndingHookFilter>] Optional filters to decide when to trigger - restricted to assistant-request
    #  related ended reasons
    attr_reader :filters
    # @return [Vapi::PhoneNumberHookCallEndingDo] This is the action to perform when the hook triggers
    attr_reader :do_
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filters [Array<Vapi::PhoneNumberCallEndingHookFilter>] Optional filters to decide when to trigger - restricted to assistant-request
    #  related ended reasons
    # @param do_ [Vapi::PhoneNumberHookCallEndingDo] This is the action to perform when the hook triggers
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PhoneNumberHookCallEnding]
    def initialize(filters: OMIT, do_: OMIT, additional_properties: nil)
      @filters = filters if filters != OMIT
      @do_ = do_ if do_ != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filters": filters, "do": do_ }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PhoneNumberHookCallEnding
    #
    # @param json_object [String]
    # @return [Vapi::PhoneNumberHookCallEnding]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      filters = parsed_json["filters"]&.map do |item|
        item = item.to_json
        Vapi::PhoneNumberCallEndingHookFilter.from_json(json_object: item)
      end
      if parsed_json["do"].nil?
        do_ = nil
      else
        do_ = parsed_json["do"].to_json
        do_ = Vapi::PhoneNumberHookCallEndingDo.from_json(json_object: do_)
      end
      new(
        filters: filters,
        do_: do_,
        additional_properties: struct
      )
    end

    # Serialize an instance of PhoneNumberHookCallEnding to a JSON object
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
      obj.filters&.is_a?(Array) != false || raise("Passed value for field obj.filters is not the expected type, validation failed.")
      obj.do_.nil? || Vapi::PhoneNumberHookCallEndingDo.validate_raw(obj: obj.do_)
    end
  end
end
