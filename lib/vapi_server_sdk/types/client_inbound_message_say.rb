# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ClientInboundMessageSay
    # @return [Boolean] This is the flag for whether the message should replace existing assistant
    #  speech.
    #  @default false
    attr_reader :interrupt_assistant_enabled
    # @return [String] This is the content to say.
    attr_reader :content
    # @return [Boolean] This is the flag to end call after content is spoken.
    attr_reader :end_call_after_spoken
    # @return [Boolean] This is the flag for whether the message is interruptible by the user.
    attr_reader :interruptions_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param interrupt_assistant_enabled [Boolean] This is the flag for whether the message should replace existing assistant
    #  speech.
    #  @default false
    # @param content [String] This is the content to say.
    # @param end_call_after_spoken [Boolean] This is the flag to end call after content is spoken.
    # @param interruptions_enabled [Boolean] This is the flag for whether the message is interruptible by the user.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ClientInboundMessageSay]
    def initialize(interrupt_assistant_enabled: OMIT, content: OMIT, end_call_after_spoken: OMIT,
                   interruptions_enabled: OMIT, additional_properties: nil)
      @interrupt_assistant_enabled = interrupt_assistant_enabled if interrupt_assistant_enabled != OMIT
      @content = content if content != OMIT
      @end_call_after_spoken = end_call_after_spoken if end_call_after_spoken != OMIT
      @interruptions_enabled = interruptions_enabled if interruptions_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "interruptAssistantEnabled": interrupt_assistant_enabled,
        "content": content,
        "endCallAfterSpoken": end_call_after_spoken,
        "interruptionsEnabled": interruptions_enabled
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
      interrupt_assistant_enabled = parsed_json["interruptAssistantEnabled"]
      content = parsed_json["content"]
      end_call_after_spoken = parsed_json["endCallAfterSpoken"]
      interruptions_enabled = parsed_json["interruptionsEnabled"]
      new(
        interrupt_assistant_enabled: interrupt_assistant_enabled,
        content: content,
        end_call_after_spoken: end_call_after_spoken,
        interruptions_enabled: interruptions_enabled,
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
      obj.interrupt_assistant_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.interrupt_assistant_enabled is not the expected type, validation failed.")
      obj.content&.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.end_call_after_spoken&.is_a?(Boolean) != false || raise("Passed value for field obj.end_call_after_spoken is not the expected type, validation failed.")
      obj.interruptions_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.interruptions_enabled is not the expected type, validation failed.")
    end
  end
end
