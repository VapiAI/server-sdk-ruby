# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageSay
    # @return [String] This is the content to say.
    attr_reader :content
    # @return [Boolean] This is the flag to end call after content is spoken.
    attr_reader :end_call_after_spoken
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param content [String] This is the content to say.
    # @param end_call_after_spoken [Boolean] This is the flag to end call after content is spoken.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageSay]
    def initialize(content: OMIT, end_call_after_spoken: OMIT, additional_properties: nil)
      @content = content if content != OMIT
      @end_call_after_spoken = end_call_after_spoken if end_call_after_spoken != OMIT
      @additional_properties = additional_properties
      @_field_set = { "content": content, "endCallAfterSpoken": end_call_after_spoken }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ClientInboundMessageSay
    #
    # @param json_object [String]
    # @return [Vapi::ClientInboundMessageSay]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      content = parsed_json["content"]
      end_call_after_spoken = parsed_json["endCallAfterSpoken"]
      new(
        content: content,
        end_call_after_spoken: end_call_after_spoken,
        additional_properties: struct
      )
    end

    # Serialize an instance of ClientInboundMessageSay to a JSON object
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
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.end_call_after_spoken&.is_a?(Boolean) != false || raise("Passed value for field obj.end_call_after_spoken is not the expected type, validation failed.")
    end
  end
end
