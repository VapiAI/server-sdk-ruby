# frozen_string_literal: true

require_relative "cartesia_generation_config_experimental"
require "ostruct"
require "json"

module Vapi
  class CartesiaGenerationConfig
    # @return [Float] Fine-grained speed control for sonic-3. Only available for sonic-3 model.
    attr_reader :speed
    # @return [Float] Fine-grained volume control for sonic-3. Only available for sonic-3 model.
    attr_reader :volume
    # @return [Vapi::CartesiaGenerationConfigExperimental] Experimental model controls for sonic-3. These are subject to breaking changes.
    attr_reader :experimental
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param speed [Float] Fine-grained speed control for sonic-3. Only available for sonic-3 model.
    # @param volume [Float] Fine-grained volume control for sonic-3. Only available for sonic-3 model.
    # @param experimental [Vapi::CartesiaGenerationConfigExperimental] Experimental model controls for sonic-3. These are subject to breaking changes.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CartesiaGenerationConfig]
    def initialize(speed: OMIT, volume: OMIT, experimental: OMIT, additional_properties: nil)
      @speed = speed if speed != OMIT
      @volume = volume if volume != OMIT
      @experimental = experimental if experimental != OMIT
      @additional_properties = additional_properties
      @_field_set = { "speed": speed, "volume": volume, "experimental": experimental }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CartesiaGenerationConfig
    #
    # @param json_object [String]
    # @return [Vapi::CartesiaGenerationConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      speed = parsed_json["speed"]
      volume = parsed_json["volume"]
      if parsed_json["experimental"].nil?
        experimental = nil
      else
        experimental = parsed_json["experimental"].to_json
        experimental = Vapi::CartesiaGenerationConfigExperimental.from_json(json_object: experimental)
      end
      new(
        speed: speed,
        volume: volume,
        experimental: experimental,
        additional_properties: struct
      )
    end

    # Serialize an instance of CartesiaGenerationConfig to a JSON object
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
      obj.speed&.is_a?(Float) != false || raise("Passed value for field obj.speed is not the expected type, validation failed.")
      obj.volume&.is_a?(Float) != false || raise("Passed value for field obj.volume is not the expected type, validation failed.")
      obj.experimental.nil? || Vapi::CartesiaGenerationConfigExperimental.validate_raw(obj: obj.experimental)
    end
  end
end
