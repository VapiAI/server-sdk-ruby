# frozen_string_literal: true

require_relative "voicemail_detection_cost_provider"
require "ostruct"
require "json"

module Vapi
  class VoicemailDetectionCost
    # @return [Hash{String => Object}] This is the model that was used to perform the analysis.
    attr_reader :model
    # @return [Vapi::VoicemailDetectionCostProvider] This is the provider that was used to detect the voicemail.
    attr_reader :provider
    # @return [Float] This is the number of prompt text tokens used in the voicemail detection.
    attr_reader :prompt_text_tokens
    # @return [Float] This is the number of prompt audio tokens used in the voicemail detection.
    attr_reader :prompt_audio_tokens
    # @return [Float] This is the number of completion text tokens used in the voicemail detection.
    attr_reader :completion_text_tokens
    # @return [Float] This is the number of completion audio tokens used in the voicemail detection.
    attr_reader :completion_audio_tokens
    # @return [Float] This is the cost of the component in USD.
    attr_reader :cost
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Hash{String => Object}] This is the model that was used to perform the analysis.
    # @param provider [Vapi::VoicemailDetectionCostProvider] This is the provider that was used to detect the voicemail.
    # @param prompt_text_tokens [Float] This is the number of prompt text tokens used in the voicemail detection.
    # @param prompt_audio_tokens [Float] This is the number of prompt audio tokens used in the voicemail detection.
    # @param completion_text_tokens [Float] This is the number of completion text tokens used in the voicemail detection.
    # @param completion_audio_tokens [Float] This is the number of completion audio tokens used in the voicemail detection.
    # @param cost [Float] This is the cost of the component in USD.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::VoicemailDetectionCost]
    def initialize(model:, provider:, prompt_text_tokens:, prompt_audio_tokens:, completion_text_tokens:,
                   completion_audio_tokens:, cost:, additional_properties: nil)
      @model = model
      @provider = provider
      @prompt_text_tokens = prompt_text_tokens
      @prompt_audio_tokens = prompt_audio_tokens
      @completion_text_tokens = completion_text_tokens
      @completion_audio_tokens = completion_audio_tokens
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "provider": provider,
        "promptTextTokens": prompt_text_tokens,
        "promptAudioTokens": prompt_audio_tokens,
        "completionTextTokens": completion_text_tokens,
        "completionAudioTokens": completion_audio_tokens,
        "cost": cost
      }
    end

    # Deserialize a JSON object to an instance of VoicemailDetectionCost
    #
    # @param json_object [String]
    # @return [Vapi::VoicemailDetectionCost]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model = parsed_json["model"]
      provider = parsed_json["provider"]
      prompt_text_tokens = parsed_json["promptTextTokens"]
      prompt_audio_tokens = parsed_json["promptAudioTokens"]
      completion_text_tokens = parsed_json["completionTextTokens"]
      completion_audio_tokens = parsed_json["completionAudioTokens"]
      cost = parsed_json["cost"]
      new(
        model: model,
        provider: provider,
        prompt_text_tokens: prompt_text_tokens,
        prompt_audio_tokens: prompt_audio_tokens,
        completion_text_tokens: completion_text_tokens,
        completion_audio_tokens: completion_audio_tokens,
        cost: cost,
        additional_properties: struct
      )
    end

    # Serialize an instance of VoicemailDetectionCost to a JSON object
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
      obj.model.is_a?(Hash) != false || raise("Passed value for field obj.model is not the expected type, validation failed.")
      obj.provider.is_a?(Vapi::VoicemailDetectionCostProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.prompt_text_tokens.is_a?(Float) != false || raise("Passed value for field obj.prompt_text_tokens is not the expected type, validation failed.")
      obj.prompt_audio_tokens.is_a?(Float) != false || raise("Passed value for field obj.prompt_audio_tokens is not the expected type, validation failed.")
      obj.completion_text_tokens.is_a?(Float) != false || raise("Passed value for field obj.completion_text_tokens is not the expected type, validation failed.")
      obj.completion_audio_tokens.is_a?(Float) != false || raise("Passed value for field obj.completion_audio_tokens is not the expected type, validation failed.")
      obj.cost.is_a?(Float) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end
