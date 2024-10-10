# frozen_string_literal: true

require_relative "tool_message_complete_role"
require_relative "condition"
require "ostruct"
require "json"

module Vapi
  class ToolMessageComplete
    # @return [Vapi::ToolMessageCompleteRole] This is optional and defaults to "assistant".
    #  When role=assistant, `content` is said out loud.
    #  When role=system, `content` is passed to the model in a system message. Example:
    #  system: default one
    #  assistant:
    #  user:
    #  assistant:
    #  user:
    #  assistant:
    #  user:
    #  assistant: tool called
    #  tool: your server response
    #  <--- system prompt as hint
    #  ---> model generates response which is spoken
    #  This is useful when you want to provide a hint to the model about what to say
    #  next.
    attr_reader :role
    # @return [Boolean] This is an optional boolean that if true, the call will end after the message is
    #  spoken. Default is false.
    #  This is ignored if `role` is set to `system`.
    #  @default false
    attr_reader :end_call_after_spoken_enabled
    # @return [String] This is the content that the assistant says when this message is triggered.
    attr_reader :content
    # @return [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
    #  in order for this message to be triggered.
    attr_reader :conditions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param role [Vapi::ToolMessageCompleteRole] This is optional and defaults to "assistant".
    #  When role=assistant, `content` is said out loud.
    #  When role=system, `content` is passed to the model in a system message. Example:
    #  system: default one
    #  assistant:
    #  user:
    #  assistant:
    #  user:
    #  assistant:
    #  user:
    #  assistant: tool called
    #  tool: your server response
    #  <--- system prompt as hint
    #  ---> model generates response which is spoken
    #  This is useful when you want to provide a hint to the model about what to say
    #  next.
    # @param end_call_after_spoken_enabled [Boolean] This is an optional boolean that if true, the call will end after the message is
    #  spoken. Default is false.
    #  This is ignored if `role` is set to `system`.
    #  @default false
    # @param content [String] This is the content that the assistant says when this message is triggered.
    # @param conditions [Array<Vapi::Condition>] This is an optional array of conditions that the tool call arguments must meet
    #  in order for this message to be triggered.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolMessageComplete]
    def initialize(content:, role: OMIT, end_call_after_spoken_enabled: OMIT, conditions: OMIT,
                   additional_properties: nil)
      @role = role if role != OMIT
      @end_call_after_spoken_enabled = end_call_after_spoken_enabled if end_call_after_spoken_enabled != OMIT
      @content = content
      @conditions = conditions if conditions != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "role": role,
        "endCallAfterSpokenEnabled": end_call_after_spoken_enabled,
        "content": content,
        "conditions": conditions
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolMessageComplete
    #
    # @param json_object [String]
    # @return [Vapi::ToolMessageComplete]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      role = parsed_json["role"]
      end_call_after_spoken_enabled = parsed_json["endCallAfterSpokenEnabled"]
      content = parsed_json["content"]
      conditions = parsed_json["conditions"]&.map do |item|
        item = item.to_json
        Vapi::Condition.from_json(json_object: item)
      end
      new(
        role: role,
        end_call_after_spoken_enabled: end_call_after_spoken_enabled,
        content: content,
        conditions: conditions,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolMessageComplete to a JSON object
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
      obj.role&.is_a?(Vapi::ToolMessageCompleteRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.end_call_after_spoken_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.end_call_after_spoken_enabled is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.conditions&.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
    end
  end
end
