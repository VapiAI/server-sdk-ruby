# frozen_string_literal: true

require_relative "cartesia_experimental_controls_speed"
require_relative "cartesia_experimental_controls_emotion"
require "ostruct"
require "json"

module Vapi
  class CartesiaExperimentalControls
    # @return [Vapi::CartesiaExperimentalControlsSpeed]
    attr_reader :speed
    # @return [Vapi::CartesiaExperimentalControlsEmotion]
    attr_reader :emotion
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param speed [Vapi::CartesiaExperimentalControlsSpeed]
    # @param emotion [Vapi::CartesiaExperimentalControlsEmotion]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CartesiaExperimentalControls]
    def initialize(speed: OMIT, emotion: OMIT, additional_properties: nil)
      @speed = speed if speed != OMIT
      @emotion = emotion if emotion != OMIT
      @additional_properties = additional_properties
      @_field_set = { "speed": speed, "emotion": emotion }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CartesiaExperimentalControls
    #
    # @param json_object [String]
    # @return [Vapi::CartesiaExperimentalControls]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      speed = parsed_json["speed"]
      emotion = parsed_json["emotion"]
      new(
        speed: speed,
        emotion: emotion,
        additional_properties: struct
      )
    end

    # Serialize an instance of CartesiaExperimentalControls to a JSON object
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
      obj.speed&.is_a?(Vapi::CartesiaExperimentalControlsSpeed) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.emotion&.is_a?(Vapi::CartesiaExperimentalControlsEmotion) != false || raise("Passed value for field obj.emotion is not the expected type, validation failed.")
    end
  end
end
