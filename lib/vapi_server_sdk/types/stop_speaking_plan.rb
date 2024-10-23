# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class StopSpeakingPlan
    # @return [Float] This is the number of words that the customer has to say before the assistant
    #  will stop talking.
    #  Words like "stop", "actually", "no", etc. will always interrupt immediately
    #  regardless of this value.
    #  Words like "okay", "yeah", "right" will never interrupt.
    #  When set to 0, `voiceSeconds` is used in addition to the transcriptions to
    #  determine the customer has started speaking.
    #  Defaults to 0.
    #  @default 0
    attr_reader :num_words
    # @return [Float] This is the seconds customer has to speak before the assistant stops talking.
    #  This uses the VAD (Voice Activity Detection) spike to determine if the customer
    #  has started speaking.
    #  Considerations:
    #  - A lower value might be more responsive but could potentially pick up
    #  non-speech sounds.
    #  - A higher value reduces false positives but might slightly delay the detection
    #  of speech onset.
    #  This is only used if `numWords` is set to 0.
    #  Defaults to 0.2
    #  @default 0.2
    attr_reader :voice_seconds
    # @return [Float] This is the seconds to wait before the assistant will start talking again after
    #  being interrupted.
    #  Defaults to 1.
    #  @default 1
    attr_reader :backoff_seconds
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param num_words [Float] This is the number of words that the customer has to say before the assistant
    #  will stop talking.
    #  Words like "stop", "actually", "no", etc. will always interrupt immediately
    #  regardless of this value.
    #  Words like "okay", "yeah", "right" will never interrupt.
    #  When set to 0, `voiceSeconds` is used in addition to the transcriptions to
    #  determine the customer has started speaking.
    #  Defaults to 0.
    #  @default 0
    # @param voice_seconds [Float] This is the seconds customer has to speak before the assistant stops talking.
    #  This uses the VAD (Voice Activity Detection) spike to determine if the customer
    #  has started speaking.
    #  Considerations:
    #  - A lower value might be more responsive but could potentially pick up
    #  non-speech sounds.
    #  - A higher value reduces false positives but might slightly delay the detection
    #  of speech onset.
    #  This is only used if `numWords` is set to 0.
    #  Defaults to 0.2
    #  @default 0.2
    # @param backoff_seconds [Float] This is the seconds to wait before the assistant will start talking again after
    #  being interrupted.
    #  Defaults to 1.
    #  @default 1
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::StopSpeakingPlan]
    def initialize(num_words: OMIT, voice_seconds: OMIT, backoff_seconds: OMIT, additional_properties: nil)
      @num_words = num_words if num_words != OMIT
      @voice_seconds = voice_seconds if voice_seconds != OMIT
      @backoff_seconds = backoff_seconds if backoff_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "numWords": num_words,
        "voiceSeconds": voice_seconds,
        "backoffSeconds": backoff_seconds
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of StopSpeakingPlan
    #
    # @param json_object [String]
    # @return [Vapi::StopSpeakingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      num_words = parsed_json["numWords"]
      voice_seconds = parsed_json["voiceSeconds"]
      backoff_seconds = parsed_json["backoffSeconds"]
      new(
        num_words: num_words,
        voice_seconds: voice_seconds,
        backoff_seconds: backoff_seconds,
        additional_properties: struct
      )
    end

    # Serialize an instance of StopSpeakingPlan to a JSON object
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
      obj.num_words&.is_a?(Float) != false || raise("Passed value for field obj.num_words is not the expected type, validation failed.")
      obj.voice_seconds&.is_a?(Float) != false || raise("Passed value for field obj.voice_seconds is not the expected type, validation failed.")
      obj.backoff_seconds&.is_a?(Float) != false || raise("Passed value for field obj.backoff_seconds is not the expected type, validation failed.")
    end
  end
end
