# frozen_string_literal: true

require_relative "play_ht_voice_voice_id"
require_relative "play_ht_voice_emotion"
require_relative "chunk_plan"
require "ostruct"
require "json"

module Vapi
  class PlayHtVoice
    # @return [Boolean] This determines whether fillers are injected into the model output before
    #  inputting it into the voice provider.
    #  Default `false` because you can achieve better results with prompting the model.
    attr_reader :filler_injection_enabled
    # @return [Vapi::PlayHtVoiceVoiceId] This is the provider-specific ID that will be used.
    attr_reader :voice_id
    # @return [Float] This is the speed multiplier that will be used.
    attr_reader :speed
    # @return [Float] A floating point number between 0, exclusive, and 2, inclusive. If equal to null
    #  or not provided, the model's default temperature will be used. The temperature
    #  parameter controls variance. Lower temperatures result in more predictable
    #  results, higher temperatures allow each run to vary more, so the voice may sound
    #  less like the baseline voice.
    attr_reader :temperature
    # @return [Vapi::PlayHtVoiceEmotion] An emotion to be applied to the speech.
    attr_reader :emotion
    # @return [Float] A number between 1 and 6. Use lower numbers to reduce how unique your chosen
    #  voice will be compared to other voices.
    attr_reader :voice_guidance
    # @return [Float] A number between 1 and 30. Use lower numbers to to reduce how strong your chosen
    #  emotion will be. Higher numbers will create a very emotional performance.
    attr_reader :style_guidance
    # @return [Float] A number between 1 and 2. This number influences how closely the generated
    #  speech adheres to the input text. Use lower values to create more fluid speech,
    #  but with a higher chance of deviating from the input text. Higher numbers will
    #  make the generated speech more accurate to the input text, ensuring that the
    #  words spoken align closely with the provided text.
    attr_reader :text_guidance
    # @return [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    attr_reader :chunk_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filler_injection_enabled [Boolean] This determines whether fillers are injected into the model output before
    #  inputting it into the voice provider.
    #  Default `false` because you can achieve better results with prompting the model.
    # @param voice_id [Vapi::PlayHtVoiceVoiceId] This is the provider-specific ID that will be used.
    # @param speed [Float] This is the speed multiplier that will be used.
    # @param temperature [Float] A floating point number between 0, exclusive, and 2, inclusive. If equal to null
    #  or not provided, the model's default temperature will be used. The temperature
    #  parameter controls variance. Lower temperatures result in more predictable
    #  results, higher temperatures allow each run to vary more, so the voice may sound
    #  less like the baseline voice.
    # @param emotion [Vapi::PlayHtVoiceEmotion] An emotion to be applied to the speech.
    # @param voice_guidance [Float] A number between 1 and 6. Use lower numbers to reduce how unique your chosen
    #  voice will be compared to other voices.
    # @param style_guidance [Float] A number between 1 and 30. Use lower numbers to to reduce how strong your chosen
    #  emotion will be. Higher numbers will create a very emotional performance.
    # @param text_guidance [Float] A number between 1 and 2. This number influences how closely the generated
    #  speech adheres to the input text. Use lower values to create more fluid speech,
    #  but with a higher chance of deviating from the input text. Higher numbers will
    #  make the generated speech more accurate to the input text, ensuring that the
    #  words spoken align closely with the provided text.
    # @param chunk_plan [Vapi::ChunkPlan] This is the plan for chunking the model output before it is sent to the voice
    #  provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PlayHtVoice]
    def initialize(voice_id:, filler_injection_enabled: OMIT, speed: OMIT, temperature: OMIT, emotion: OMIT,
                   voice_guidance: OMIT, style_guidance: OMIT, text_guidance: OMIT, chunk_plan: OMIT, additional_properties: nil)
      @filler_injection_enabled = filler_injection_enabled if filler_injection_enabled != OMIT
      @voice_id = voice_id
      @speed = speed if speed != OMIT
      @temperature = temperature if temperature != OMIT
      @emotion = emotion if emotion != OMIT
      @voice_guidance = voice_guidance if voice_guidance != OMIT
      @style_guidance = style_guidance if style_guidance != OMIT
      @text_guidance = text_guidance if text_guidance != OMIT
      @chunk_plan = chunk_plan if chunk_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "fillerInjectionEnabled": filler_injection_enabled,
        "voiceId": voice_id,
        "speed": speed,
        "temperature": temperature,
        "emotion": emotion,
        "voiceGuidance": voice_guidance,
        "styleGuidance": style_guidance,
        "textGuidance": text_guidance,
        "chunkPlan": chunk_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PlayHtVoice
    #
    # @param json_object [String]
    # @return [Vapi::PlayHtVoice]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      filler_injection_enabled = parsed_json["fillerInjectionEnabled"]
      if parsed_json["voiceId"].nil?
        voice_id = nil
      else
        voice_id = parsed_json["voiceId"].to_json
        voice_id = Vapi::PlayHtVoiceVoiceId.from_json(json_object: voice_id)
      end
      speed = parsed_json["speed"]
      temperature = parsed_json["temperature"]
      emotion = parsed_json["emotion"]
      voice_guidance = parsed_json["voiceGuidance"]
      style_guidance = parsed_json["styleGuidance"]
      text_guidance = parsed_json["textGuidance"]
      if parsed_json["chunkPlan"].nil?
        chunk_plan = nil
      else
        chunk_plan = parsed_json["chunkPlan"].to_json
        chunk_plan = Vapi::ChunkPlan.from_json(json_object: chunk_plan)
      end
      new(
        filler_injection_enabled: filler_injection_enabled,
        voice_id: voice_id,
        speed: speed,
        temperature: temperature,
        emotion: emotion,
        voice_guidance: voice_guidance,
        style_guidance: style_guidance,
        text_guidance: text_guidance,
        chunk_plan: chunk_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of PlayHtVoice to a JSON object
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
      obj.filler_injection_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.filler_injection_enabled is not the expected type, validation failed.")
      Vapi::PlayHtVoiceVoiceId.validate_raw(obj: obj.voice_id)
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.emotion&.is_a?(Vapi::PlayHtVoiceEmotion) != false || raise("Passed value for field obj.emotion is not the expected type, validation failed.")
      obj.voice_guidance&.is_a?(Float) != false || raise("Passed value for field obj.voice_guidance is not the expected type, validation failed.")
      obj.style_guidance&.is_a?(Float) != false || raise("Passed value for field obj.style_guidance is not the expected type, validation failed.")
      obj.text_guidance&.is_a?(Float) != false || raise("Passed value for field obj.text_guidance is not the expected type, validation failed.")
      obj.chunk_plan.nil? || Vapi::ChunkPlan.validate_raw(obj: obj.chunk_plan)
    end
  end
end
