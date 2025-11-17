# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TurnLatency
    # @return [Float] This is the model latency for the first token.
    attr_reader :model_latency
    # @return [Float] This is the voice latency from the model output.
    attr_reader :voice_latency
    # @return [Float] This is the transcriber latency from the user speech.
    attr_reader :transcriber_latency
    # @return [Float] This is the endpointing latency.
    attr_reader :endpointing_latency
    # @return [Float] This is the latency for the whole turn.
    attr_reader :turn_latency
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model_latency [Float] This is the model latency for the first token.
    # @param voice_latency [Float] This is the voice latency from the model output.
    # @param transcriber_latency [Float] This is the transcriber latency from the user speech.
    # @param endpointing_latency [Float] This is the endpointing latency.
    # @param turn_latency [Float] This is the latency for the whole turn.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TurnLatency]
    def initialize(model_latency: OMIT, voice_latency: OMIT, transcriber_latency: OMIT, endpointing_latency: OMIT,
                   turn_latency: OMIT, additional_properties: nil)
      @model_latency = model_latency if model_latency != OMIT
      @voice_latency = voice_latency if voice_latency != OMIT
      @transcriber_latency = transcriber_latency if transcriber_latency != OMIT
      @endpointing_latency = endpointing_latency if endpointing_latency != OMIT
      @turn_latency = turn_latency if turn_latency != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "modelLatency": model_latency,
        "voiceLatency": voice_latency,
        "transcriberLatency": transcriber_latency,
        "endpointingLatency": endpointing_latency,
        "turnLatency": turn_latency
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TurnLatency
    #
    # @param json_object [String]
    # @return [Vapi::TurnLatency]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_latency = parsed_json["modelLatency"]
      voice_latency = parsed_json["voiceLatency"]
      transcriber_latency = parsed_json["transcriberLatency"]
      endpointing_latency = parsed_json["endpointingLatency"]
      turn_latency = parsed_json["turnLatency"]
      new(
        model_latency: model_latency,
        voice_latency: voice_latency,
        transcriber_latency: transcriber_latency,
        endpointing_latency: endpointing_latency,
        turn_latency: turn_latency,
        additional_properties: struct
      )
    end

    # Serialize an instance of TurnLatency to a JSON object
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
      obj.model_latency&.is_a?(Float) != false || raise("Passed value for field obj.model_latency is not the expected type, validation failed.")
      obj.voice_latency&.is_a?(Float) != false || raise("Passed value for field obj.voice_latency is not the expected type, validation failed.")
      obj.transcriber_latency&.is_a?(Float) != false || raise("Passed value for field obj.transcriber_latency is not the expected type, validation failed.")
      obj.endpointing_latency&.is_a?(Float) != false || raise("Passed value for field obj.endpointing_latency is not the expected type, validation failed.")
      obj.turn_latency&.is_a?(Float) != false || raise("Passed value for field obj.turn_latency is not the expected type, validation failed.")
    end
  end
end
