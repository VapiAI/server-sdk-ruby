# frozen_string_literal: true

require_relative "sync_voice_library_dto_providers_item"
require "ostruct"
require "json"

module Vapi
  class SyncVoiceLibraryDto
    # @return [Array<Vapi::SyncVoiceLibraryDtoProvidersItem>] List of providers you want to sync.
    attr_reader :providers
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param providers [Array<Vapi::SyncVoiceLibraryDtoProvidersItem>] List of providers you want to sync.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SyncVoiceLibraryDto]
    def initialize(providers: OMIT, additional_properties: nil)
      @providers = providers if providers != OMIT
      @additional_properties = additional_properties
      @_field_set = { "providers": providers }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SyncVoiceLibraryDto
    #
    # @param json_object [String]
    # @return [Vapi::SyncVoiceLibraryDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      providers = parsed_json["providers"]
      new(providers: providers, additional_properties: struct)
    end

    # Serialize an instance of SyncVoiceLibraryDto to a JSON object
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
      obj.providers&.is_a?(Array) != false || raise("Passed value for field obj.providers is not the expected type, validation failed.")
    end
  end
end
