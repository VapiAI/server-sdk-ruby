# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageSay
    # @return [String] This is the type of the message. Send "say" message to make the assistant say
    #  something.
    attr_reader :type
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

    # @param type [String] This is the type of the message. Send "say" message to make the assistant say
    #  something.
    # @param content [String] This is the content to say.
    # @param end_call_after_spoken [Boolean] This is the flag to end call after content is spoken.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageSay]
    def initialize(type: OMIT, content: OMIT, end_call_after_spoken: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @content = content if content != OMIT
      @end_call_after_spoken = end_call_after_spoken if end_call_after_spoken != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "type": type,
        "content": content,
        "endCallAfterSpoken": end_call_after_spoken
      }.reject do |_k, v|
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
      type = parsed_json["type"]
      content = parsed_json["content"]
      end_call_after_spoken = parsed_json["endCallAfterSpoken"]
      new(
        type: type,
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
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.end_call_after_spoken&.is_a?(Boolean) != false || raise("Passed value for field obj.end_call_after_spoken is not the expected type, validation failed.")
    end
  end
end
