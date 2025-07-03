# frozen_string_literal: true
require_relative "workflow_custom_model_metadata_send_mode"
require "ostruct"
require "json"

module Vapi
  class WorkflowCustomModel
  # @return [Vapi::WorkflowCustomModelMetadataSendMode] This determines whether metadata is sent in requests to the custom provider.
#  - `off` will not send any metadata. payload will look like `{ messages }`
#  - `variable` will send `assistant.metadata` as a variable on the payload.
#  payload will look like `{ messages, metadata }`
#  - `destructured` will send `assistant.metadata` fields directly on the payload.
#  payload will look like `{ messages, ...metadata }`
#  Further, `variable` and `destructured` will send `call`, `phoneNumber`, and
#  `customer` objects in the payload.
#  Default is `variable`.
    attr_reader :metadata_send_mode
  # @return [String] These is the URL we'll use for the OpenAI client's `baseURL`. Ex.
#  https://openrouter.ai/api/v1
    attr_reader :url
  # @return [Float] This sets the timeout for the connection to the custom provider without needing
#  to stream any tokens back. Default is 20 seconds.
    attr_reader :timeout_seconds
  # @return [String] This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
    attr_reader :model
  # @return [Float] This is the temperature of the model.
    attr_reader :temperature
  # @return [Float] This is the max tokens of the model.
    attr_reader :max_tokens
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param metadata_send_mode [Vapi::WorkflowCustomModelMetadataSendMode] This determines whether metadata is sent in requests to the custom provider.
#  - `off` will not send any metadata. payload will look like `{ messages }`
#  - `variable` will send `assistant.metadata` as a variable on the payload.
#  payload will look like `{ messages, metadata }`
#  - `destructured` will send `assistant.metadata` fields directly on the payload.
#  payload will look like `{ messages, ...metadata }`
#  Further, `variable` and `destructured` will send `call`, `phoneNumber`, and
#  `customer` objects in the payload.
#  Default is `variable`.
    # @param url [String] These is the URL we'll use for the OpenAI client's `baseURL`. Ex.
#  https://openrouter.ai/api/v1
    # @param timeout_seconds [Float] This sets the timeout for the connection to the custom provider without needing
#  to stream any tokens back. Default is 20 seconds.
    # @param model [String] This is the name of the model. Ex. cognitivecomputations/dolphin-mixtral-8x7b
    # @param temperature [Float] This is the temperature of the model.
    # @param max_tokens [Float] This is the max tokens of the model.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::WorkflowCustomModel]
    def initialize(metadata_send_mode: OMIT, url:, timeout_seconds: OMIT, model:, temperature: OMIT, max_tokens: OMIT, additional_properties: nil)
      @metadata_send_mode = metadata_send_mode if metadata_send_mode != OMIT
      @url = url
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @model = model
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @additional_properties = additional_properties
      @_field_set = { "metadataSendMode": metadata_send_mode, "url": url, "timeoutSeconds": timeout_seconds, "model": model, "temperature": temperature, "maxTokens": max_tokens }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowCustomModel
    #
    # @param json_object [String] 
    # @return [Vapi::WorkflowCustomModel]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      metadata_send_mode = parsed_json["metadataSendMode"]
      url = parsed_json["url"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      model = parsed_json["model"]
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["maxTokens"]
      new(
        metadata_send_mode: metadata_send_mode,
        url: url,
        timeout_seconds: timeout_seconds,
        model: model,
        temperature: temperature,
        max_tokens: max_tokens,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowCustomModel to a JSON object
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
      obj.metadata_send_mode&.is_a?(Vapi::WorkflowCustomModelMetadataSendMode) != false || raise("Passed value for field obj.metadata_send_mode is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.model.is_a?(String) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Float) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
    end
  end
end