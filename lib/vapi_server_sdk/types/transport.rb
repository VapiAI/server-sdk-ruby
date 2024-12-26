# frozen_string_literal: true

require_relative "transport_provider"
require "ostruct"
require "json"

module Vapi
  class Transport
    # @return [Vapi::TransportProvider] This is the provider used for the call.
    attr_reader :provider
    # @return [Boolean] This is determines whether the assistant will have video enabled.
    #  Only relevant for `webCall` type.
    attr_reader :assistant_video_enabled
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [Vapi::TransportProvider] This is the provider used for the call.
    # @param assistant_video_enabled [Boolean] This is determines whether the assistant will have video enabled.
    #  Only relevant for `webCall` type.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Transport]
    def initialize(provider: OMIT, assistant_video_enabled: OMIT, additional_properties: nil)
      @provider = provider if provider != OMIT
      @assistant_video_enabled = assistant_video_enabled if assistant_video_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "assistantVideoEnabled": assistant_video_enabled }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Transport
    #
    # @param json_object [String]
    # @return [Vapi::Transport]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      assistant_video_enabled = parsed_json["assistantVideoEnabled"]
      new(
        provider: provider,
        assistant_video_enabled: assistant_video_enabled,
        additional_properties: struct
      )
    end

    # Serialize an instance of Transport to a JSON object
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
      obj.provider&.is_a?(Vapi::TransportProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.assistant_video_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.assistant_video_enabled is not the expected type, validation failed.")
    end
  end
end
