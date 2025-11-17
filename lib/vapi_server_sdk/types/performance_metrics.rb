# frozen_string_literal: true

require_relative "turn_latency"
require "ostruct"
require "json"

module Vapi
  class PerformanceMetrics
    # @return [Array<Vapi::TurnLatency>] These are the individual latencies for each turn.
    attr_reader :turn_latencies
    # @return [Float] This is the average latency for the model to output the first token.
    attr_reader :model_latency_average
    # @return [Float] This is the average latency for the text to speech.
    attr_reader :voice_latency_average
    # @return [Float] This is the average latency for the transcriber.
    attr_reader :transcriber_latency_average
    # @return [Float] This is the average latency for the endpointing.
    attr_reader :endpointing_latency_average
    # @return [Float] This is the average latency for complete turns.
    attr_reader :turn_latency_average
    # @return [Float] This is the average latency for packets received from the transport provider in
    #  milliseconds.
    attr_reader :from_transport_latency_average
    # @return [Float] This is the average latency for packets sent to the transport provider in
    #  milliseconds.
    attr_reader :to_transport_latency_average
    # @return [Float] This is the number of times the user was interrupted by the assistant during the
    #  call.
    attr_reader :num_user_interrupted
    # @return [Float] This is the number of times the assistant was interrupted by the user during the
    #  call.
    attr_reader :num_assistant_interrupted
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param turn_latencies [Array<Vapi::TurnLatency>] These are the individual latencies for each turn.
    # @param model_latency_average [Float] This is the average latency for the model to output the first token.
    # @param voice_latency_average [Float] This is the average latency for the text to speech.
    # @param transcriber_latency_average [Float] This is the average latency for the transcriber.
    # @param endpointing_latency_average [Float] This is the average latency for the endpointing.
    # @param turn_latency_average [Float] This is the average latency for complete turns.
    # @param from_transport_latency_average [Float] This is the average latency for packets received from the transport provider in
    #  milliseconds.
    # @param to_transport_latency_average [Float] This is the average latency for packets sent to the transport provider in
    #  milliseconds.
    # @param num_user_interrupted [Float] This is the number of times the user was interrupted by the assistant during the
    #  call.
    # @param num_assistant_interrupted [Float] This is the number of times the assistant was interrupted by the user during the
    #  call.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::PerformanceMetrics]
    def initialize(turn_latencies: OMIT, model_latency_average: OMIT, voice_latency_average: OMIT,
                   transcriber_latency_average: OMIT, endpointing_latency_average: OMIT, turn_latency_average: OMIT, from_transport_latency_average: OMIT, to_transport_latency_average: OMIT, num_user_interrupted: OMIT, num_assistant_interrupted: OMIT, additional_properties: nil)
      @turn_latencies = turn_latencies if turn_latencies != OMIT
      @model_latency_average = model_latency_average if model_latency_average != OMIT
      @voice_latency_average = voice_latency_average if voice_latency_average != OMIT
      @transcriber_latency_average = transcriber_latency_average if transcriber_latency_average != OMIT
      @endpointing_latency_average = endpointing_latency_average if endpointing_latency_average != OMIT
      @turn_latency_average = turn_latency_average if turn_latency_average != OMIT
      @from_transport_latency_average = from_transport_latency_average if from_transport_latency_average != OMIT
      @to_transport_latency_average = to_transport_latency_average if to_transport_latency_average != OMIT
      @num_user_interrupted = num_user_interrupted if num_user_interrupted != OMIT
      @num_assistant_interrupted = num_assistant_interrupted if num_assistant_interrupted != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "turnLatencies": turn_latencies,
        "modelLatencyAverage": model_latency_average,
        "voiceLatencyAverage": voice_latency_average,
        "transcriberLatencyAverage": transcriber_latency_average,
        "endpointingLatencyAverage": endpointing_latency_average,
        "turnLatencyAverage": turn_latency_average,
        "fromTransportLatencyAverage": from_transport_latency_average,
        "toTransportLatencyAverage": to_transport_latency_average,
        "numUserInterrupted": num_user_interrupted,
        "numAssistantInterrupted": num_assistant_interrupted
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of PerformanceMetrics
    #
    # @param json_object [String]
    # @return [Vapi::PerformanceMetrics]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      turn_latencies = parsed_json["turnLatencies"]&.map do |item|
        item = item.to_json
        Vapi::TurnLatency.from_json(json_object: item)
      end
      model_latency_average = parsed_json["modelLatencyAverage"]
      voice_latency_average = parsed_json["voiceLatencyAverage"]
      transcriber_latency_average = parsed_json["transcriberLatencyAverage"]
      endpointing_latency_average = parsed_json["endpointingLatencyAverage"]
      turn_latency_average = parsed_json["turnLatencyAverage"]
      from_transport_latency_average = parsed_json["fromTransportLatencyAverage"]
      to_transport_latency_average = parsed_json["toTransportLatencyAverage"]
      num_user_interrupted = parsed_json["numUserInterrupted"]
      num_assistant_interrupted = parsed_json["numAssistantInterrupted"]
      new(
        turn_latencies: turn_latencies,
        model_latency_average: model_latency_average,
        voice_latency_average: voice_latency_average,
        transcriber_latency_average: transcriber_latency_average,
        endpointing_latency_average: endpointing_latency_average,
        turn_latency_average: turn_latency_average,
        from_transport_latency_average: from_transport_latency_average,
        to_transport_latency_average: to_transport_latency_average,
        num_user_interrupted: num_user_interrupted,
        num_assistant_interrupted: num_assistant_interrupted,
        additional_properties: struct
      )
    end

    # Serialize an instance of PerformanceMetrics to a JSON object
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
      obj.turn_latencies&.is_a?(Array) != false || raise("Passed value for field obj.turn_latencies is not the expected type, validation failed.")
      obj.model_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.model_latency_average is not the expected type, validation failed.")
      obj.voice_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.voice_latency_average is not the expected type, validation failed.")
      obj.transcriber_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.transcriber_latency_average is not the expected type, validation failed.")
      obj.endpointing_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.endpointing_latency_average is not the expected type, validation failed.")
      obj.turn_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.turn_latency_average is not the expected type, validation failed.")
      obj.from_transport_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.from_transport_latency_average is not the expected type, validation failed.")
      obj.to_transport_latency_average&.is_a?(Float) != false || raise("Passed value for field obj.to_transport_latency_average is not the expected type, validation failed.")
      obj.num_user_interrupted&.is_a?(Float) != false || raise("Passed value for field obj.num_user_interrupted is not the expected type, validation failed.")
      obj.num_assistant_interrupted&.is_a?(Float) != false || raise("Passed value for field obj.num_assistant_interrupted is not the expected type, validation failed.")
    end
  end
end
