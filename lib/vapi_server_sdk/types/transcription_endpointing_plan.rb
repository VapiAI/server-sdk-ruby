# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class TranscriptionEndpointingPlan
    # @return [Float] The minimum number of seconds to wait after transcription ending with
    #  punctuation before sending a request to the model. Defaults to 0.1.
    #  This setting exists because the transcriber punctuates the transcription when
    #  it's more confident that customer has completed a thought.
    #  @default 0.1
    attr_reader :on_punctuation_seconds
    # @return [Float] The minimum number of seconds to wait after transcription ending without
    #  punctuation before sending a request to the model. Defaults to 1.5.
    #  This setting exists to catch the cases where the transcriber was not confident
    #  enough to punctuate the transcription, but the customer is done and has been
    #  silent for a long time.
    #  @default 1.5
    attr_reader :on_no_punctuation_seconds
    # @return [Float] The minimum number of seconds to wait after transcription ending with a number
    #  before sending a request to the model. Defaults to 0.4.
    #  This setting exists because the transcriber will sometimes punctuate the
    #  transcription ending with a number, even though the customer hasn't uttered the
    #  full number. This happens commonly for long numbers when the customer reads the
    #  number in chunks.
    #  @default 0.5
    attr_reader :on_number_seconds
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param on_punctuation_seconds [Float] The minimum number of seconds to wait after transcription ending with
    #  punctuation before sending a request to the model. Defaults to 0.1.
    #  This setting exists because the transcriber punctuates the transcription when
    #  it's more confident that customer has completed a thought.
    #  @default 0.1
    # @param on_no_punctuation_seconds [Float] The minimum number of seconds to wait after transcription ending without
    #  punctuation before sending a request to the model. Defaults to 1.5.
    #  This setting exists to catch the cases where the transcriber was not confident
    #  enough to punctuate the transcription, but the customer is done and has been
    #  silent for a long time.
    #  @default 1.5
    # @param on_number_seconds [Float] The minimum number of seconds to wait after transcription ending with a number
    #  before sending a request to the model. Defaults to 0.4.
    #  This setting exists because the transcriber will sometimes punctuate the
    #  transcription ending with a number, even though the customer hasn't uttered the
    #  full number. This happens commonly for long numbers when the customer reads the
    #  number in chunks.
    #  @default 0.5
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::TranscriptionEndpointingPlan]
    def initialize(on_punctuation_seconds: OMIT, on_no_punctuation_seconds: OMIT, on_number_seconds: OMIT,
                   additional_properties: nil)
      @on_punctuation_seconds = on_punctuation_seconds if on_punctuation_seconds != OMIT
      @on_no_punctuation_seconds = on_no_punctuation_seconds if on_no_punctuation_seconds != OMIT
      @on_number_seconds = on_number_seconds if on_number_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "onPunctuationSeconds": on_punctuation_seconds,
        "onNoPunctuationSeconds": on_no_punctuation_seconds,
        "onNumberSeconds": on_number_seconds
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of TranscriptionEndpointingPlan
    #
    # @param json_object [String]
    # @return [Vapi::TranscriptionEndpointingPlan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      on_punctuation_seconds = parsed_json["onPunctuationSeconds"]
      on_no_punctuation_seconds = parsed_json["onNoPunctuationSeconds"]
      on_number_seconds = parsed_json["onNumberSeconds"]
      new(
        on_punctuation_seconds: on_punctuation_seconds,
        on_no_punctuation_seconds: on_no_punctuation_seconds,
        on_number_seconds: on_number_seconds,
        additional_properties: struct
      )
    end

    # Serialize an instance of TranscriptionEndpointingPlan to a JSON object
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
      obj.on_punctuation_seconds&.is_a?(Float) != false || raise("Passed value for field obj.on_punctuation_seconds is not the expected type, validation failed.")
      obj.on_no_punctuation_seconds&.is_a?(Float) != false || raise("Passed value for field obj.on_no_punctuation_seconds is not the expected type, validation failed.")
      obj.on_number_seconds&.is_a?(Float) != false || raise("Passed value for field obj.on_number_seconds is not the expected type, validation failed.")
    end
  end
end
