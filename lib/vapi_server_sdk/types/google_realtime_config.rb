# frozen_string_literal: true

require_relative "gemini_multimodal_live_speech_config"
require "ostruct"
require "json"

module Vapi
  class GoogleRealtimeConfig
    # @return [Float] This is the nucleus sampling parameter that controls the cumulative probability
    #  of tokens considered during text generation.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    attr_reader :top_p
    # @return [Float] This is the top-k sampling parameter that limits the number of highest
    #  probability tokens considered during text generation.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    attr_reader :top_k
    # @return [Float] This is the presence penalty parameter that influences the model's likelihood to
    #  repeat information by penalizing tokens based on their presence in the text.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    attr_reader :presence_penalty
    # @return [Float] This is the frequency penalty parameter that influences the model's likelihood
    #  to repeat tokens by penalizing them based on their frequency in the text.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    attr_reader :frequency_penalty
    # @return [Vapi::GeminiMultimodalLiveSpeechConfig] This is the speech configuration object that defines the voice settings to be
    #  used for the model's speech output.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    attr_reader :speech_config
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param top_p [Float] This is the nucleus sampling parameter that controls the cumulative probability
    #  of tokens considered during text generation.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    # @param top_k [Float] This is the top-k sampling parameter that limits the number of highest
    #  probability tokens considered during text generation.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    # @param presence_penalty [Float] This is the presence penalty parameter that influences the model's likelihood to
    #  repeat information by penalizing tokens based on their presence in the text.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    # @param frequency_penalty [Float] This is the frequency penalty parameter that influences the model's likelihood
    #  to repeat tokens by penalizing them based on their frequency in the text.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    # @param speech_config [Vapi::GeminiMultimodalLiveSpeechConfig] This is the speech configuration object that defines the voice settings to be
    #  used for the model's speech output.
    #  Only applicable with the Gemini Flash 2.0 Multimodal Live API.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::GoogleRealtimeConfig]
    def initialize(top_p: OMIT, top_k: OMIT, presence_penalty: OMIT, frequency_penalty: OMIT, speech_config: OMIT,
                   additional_properties: nil)
      @top_p = top_p if top_p != OMIT
      @top_k = top_k if top_k != OMIT
      @presence_penalty = presence_penalty if presence_penalty != OMIT
      @frequency_penalty = frequency_penalty if frequency_penalty != OMIT
      @speech_config = speech_config if speech_config != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "topP": top_p,
        "topK": top_k,
        "presencePenalty": presence_penalty,
        "frequencyPenalty": frequency_penalty,
        "speechConfig": speech_config
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of GoogleRealtimeConfig
    #
    # @param json_object [String]
    # @return [Vapi::GoogleRealtimeConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      top_p = parsed_json["topP"]
      top_k = parsed_json["topK"]
      presence_penalty = parsed_json["presencePenalty"]
      frequency_penalty = parsed_json["frequencyPenalty"]
      if parsed_json["speechConfig"].nil?
        speech_config = nil
      else
        speech_config = parsed_json["speechConfig"].to_json
        speech_config = Vapi::GeminiMultimodalLiveSpeechConfig.from_json(json_object: speech_config)
      end
      new(
        top_p: top_p,
        top_k: top_k,
        presence_penalty: presence_penalty,
        frequency_penalty: frequency_penalty,
        speech_config: speech_config,
        additional_properties: struct
      )
    end

    # Serialize an instance of GoogleRealtimeConfig to a JSON object
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
      obj.top_p&.is_a?(Float) != false || raise("Passed value for field obj.top_p is not the expected type, validation failed.")
      obj.top_k&.is_a?(Float) != false || raise("Passed value for field obj.top_k is not the expected type, validation failed.")
      obj.presence_penalty&.is_a?(Float) != false || raise("Passed value for field obj.presence_penalty is not the expected type, validation failed.")
      obj.frequency_penalty&.is_a?(Float) != false || raise("Passed value for field obj.frequency_penalty is not the expected type, validation failed.")
      obj.speech_config.nil? || Vapi::GeminiMultimodalLiveSpeechConfig.validate_raw(obj: obj.speech_config)
    end
  end
end
