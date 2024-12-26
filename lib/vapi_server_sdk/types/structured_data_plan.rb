# frozen_string_literal: true

require_relative "json_schema"
require "ostruct"
require "json"

module Vapi
  class StructuredDataPlan
    # @return [Array<Hash{String => Object}>] These are the messages used to generate the structured data.
    #  @default: ```
    #  [
    #  {
    #  "role": "system",
    #  "content": "You are an expert data extractor. You will be given a transcript
    #  of a call. Extract structured data per the JSON Schema. DO NOT return anything
    #  except the structured data.\n\nJson Schema:\\n{{schema}}\n\nOnly respond with
    #  the JSON."
    #  },
    #  {
    #  "role": "user",
    #  "content": "Here is the transcript:\n\n{{transcript}}\n\n"
    #  }
    #  ]```
    #  You can customize by providing any messages you want.
    #  Here are the template variables available:
    #  - {{transcript}}: the transcript of the call from `call.artifact.transcript`-
    #  {{systemPrompt}}: the system prompt of the call from
    #  `assistant.model.messages[type=system].content`- {{schema}}: the schema of the
    #  structured data from `structuredDataPlan.schema`
    attr_reader :messages
    # @return [Boolean] This determines whether structured data is generated and stored in
    #  `call.analysis.structuredData`. Defaults to false.
    #  Usage:
    #  - If you want to extract structured data, set this to true and provide a
    #  `schema`.
    #  @default false
    attr_reader :enabled
    # @return [Vapi::JsonSchema] This is the schema of the structured data. The output is stored in
    #  `call.analysis.structuredData`.
    #  Complete guide on JSON Schema can be found
    #  [here](https://ajv.js.org/json-schema.html#json-data-type).
    attr_reader :schema
    # @return [Float] This is how long the request is tried before giving up. When request times out,
    #  `call.analysis.structuredData` will be empty.
    #  Usage:
    #  - To guarantee the structured data is generated, set this value high. Note, this
    #  will delay the end of call report in cases where model is slow to respond.
    #  @default 5 seconds
    attr_reader :timeout_seconds
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Hash{String => Object}>] These are the messages used to generate the structured data.
    #  @default: ```
    #  [
    #  {
    #  "role": "system",
    #  "content": "You are an expert data extractor. You will be given a transcript
    #  of a call. Extract structured data per the JSON Schema. DO NOT return anything
    #  except the structured data.\n\nJson Schema:\\n{{schema}}\n\nOnly respond with
    #  the JSON."
    #  },
    #  {
    #  "role": "user",
    #  "content": "Here is the transcript:\n\n{{transcript}}\n\n"
    #  }
    #  ]```
    #  You can customize by providing any messages you want.
    #  Here are the template variables available:
    #  - {{transcript}}: the transcript of the call from `call.artifact.transcript`-
    #  {{systemPrompt}}: the system prompt of the call from
    #  `assistant.model.messages[type=system].content`- {{schema}}: the schema of the
    #  structured data from `structuredDataPlan.schema`
    # @param enabled [Boolean] This determines whether structured data is generated and stored in
    #  `call.analysis.structuredData`. Defaults to false.
    #  Usage:
    #  - If you want to extract structured data, set this to true and provide a
    #  `schema`.
    #  @default false
    # @param schema [Vapi::JsonSchema] This is the schema of the structured data. The output is stored in
    #  `call.analysis.structuredData`.
    #  Complete guide on JSON Schema can be found
    #  [here](https://ajv.js.org/json-schema.html#json-data-type).
    # @param timeout_seconds [Float] This is how long the request is tried before giving up. When request times out,
    #  `call.analysis.structuredData` will be empty.
    #  Usage:
    #  - To guarantee the structured data is generated, set this value high. Note, this
    #  will delay the end of call report in cases where model is slow to respond.
    #  @default 5 seconds
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::StructuredDataPlan]
    def initialize(messages: OMIT, enabled: OMIT, schema: OMIT, timeout_seconds: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @enabled = enabled if enabled != OMIT
      @schema = schema if schema != OMIT
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "enabled": enabled,
        "schema": schema,
        "timeoutSeconds": timeout_seconds
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StructuredDataPlan
    #
    # @param json_object [String]
    # @return [Vapi::StructuredDataPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]
      enabled = parsed_json["enabled"]
      if parsed_json["schema"].nil?
        schema = nil
      else
        schema = parsed_json["schema"].to_json
        schema = Vapi::JsonSchema.from_json(json_object: schema)
      end
      timeout_seconds = parsed_json["timeoutSeconds"]
      new(
        messages: messages,
        enabled: enabled,
        schema: schema,
        timeout_seconds: timeout_seconds,
        additional_properties: struct
      )
    end

    # Serialize an instance of StructuredDataPlan to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
      obj.schema.nil? || Vapi::JsonSchema.validate_raw(obj: obj.schema)
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
    end
  end
end
