# frozen_string_literal: true
require "ostruct"
require "json"

module Vapi
  class SummaryPlan
  # @return [Array<Hash{String => Object}>] These are the messages used to generate the summary.
#  @default: ```
#  [
#  {
#  "role": "system",
#  "content": "You are an expert note-taker. You will be given a transcript of
#  a call. Summarize the call in 2-3 sentences. DO NOT return anything except the
#  summary."
#  },
#  {
#  "role": "user",
#  "content": "Here is the transcript:\n\n{{transcript}}\n\n. Here is the ended
#  reason of the call:\n\n{{endedReason}}\n\n"
#  }
#  ]```
#  You can customize by providing any messages you want.
#  Here are the template variables available:
#  - {{transcript}}: The transcript of the call from `call.artifact.transcript`
#  - {{systemPrompt}}: The system prompt of the call from
#  `assistant.model.messages[type=system].content`
#  - {{endedReason}}: The ended reason of the call from `call.endedReason`
    attr_reader :messages
  # @return [Boolean] This determines whether a summary is generated and stored in
#  `call.analysis.summary`. Defaults to true.
#  Usage:
#  - If you want to disable the summary, set this to false.
#  @default true
    attr_reader :enabled
  # @return [Float] This is how long the request is tried before giving up. When request times out,
#  `call.analysis.summary` will be empty.
#  Usage:
#  - To guarantee the summary is generated, set this value high. Note, this will
#  delay the end of call report in cases where model is slow to respond.
#  @default 5 seconds
    attr_reader :timeout_seconds
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Hash{String => Object}>] These are the messages used to generate the summary.
#  @default: ```
#  [
#  {
#  "role": "system",
#  "content": "You are an expert note-taker. You will be given a transcript of
#  a call. Summarize the call in 2-3 sentences. DO NOT return anything except the
#  summary."
#  },
#  {
#  "role": "user",
#  "content": "Here is the transcript:\n\n{{transcript}}\n\n. Here is the ended
#  reason of the call:\n\n{{endedReason}}\n\n"
#  }
#  ]```
#  You can customize by providing any messages you want.
#  Here are the template variables available:
#  - {{transcript}}: The transcript of the call from `call.artifact.transcript`
#  - {{systemPrompt}}: The system prompt of the call from
#  `assistant.model.messages[type=system].content`
#  - {{endedReason}}: The ended reason of the call from `call.endedReason`
    # @param enabled [Boolean] This determines whether a summary is generated and stored in
#  `call.analysis.summary`. Defaults to true.
#  Usage:
#  - If you want to disable the summary, set this to false.
#  @default true
    # @param timeout_seconds [Float] This is how long the request is tried before giving up. When request times out,
#  `call.analysis.summary` will be empty.
#  Usage:
#  - To guarantee the summary is generated, set this value high. Note, this will
#  delay the end of call report in cases where model is slow to respond.
#  @default 5 seconds
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SummaryPlan]
    def initialize(messages: OMIT, enabled: OMIT, timeout_seconds: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @enabled = enabled if enabled != OMIT
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "enabled": enabled, "timeoutSeconds": timeout_seconds }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SummaryPlan
    #
    # @param json_object [String] 
    # @return [Vapi::SummaryPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]
      enabled = parsed_json["enabled"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      new(
        messages: messages,
        enabled: enabled,
        timeout_seconds: timeout_seconds,
        additional_properties: struct
      )
    end
# Serialize an instance of SummaryPlan to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
    end
  end
end