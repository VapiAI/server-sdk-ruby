# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class CloneVoiceDto
    # @return [String] This is the name of the cloned voice in the provider account.
    attr_reader :name
    # @return [String] This is the description of your cloned voice.
    attr_reader :description
    # @return [String] Serialized labels dictionary for the voice.
    attr_reader :labels
    # @return [Array<String>] These are the files you want to use to clone your voice. Only Audio files are
    #  supported.
    attr_reader :files
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the cloned voice in the provider account.
    # @param description [String] This is the description of your cloned voice.
    # @param labels [String] Serialized labels dictionary for the voice.
    # @param files [Array<String>] These are the files you want to use to clone your voice. Only Audio files are
    #  supported.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CloneVoiceDto]
    def initialize(name:, files:, description: OMIT, labels: OMIT, additional_properties: nil)
      @name = name
      @description = description if description != OMIT
      @labels = labels if labels != OMIT
      @files = files
      @additional_properties = additional_properties
      @_field_set = { "name": name, "description": description, "labels": labels, "files": files }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CloneVoiceDto
    #
    # @param json_object [String]
    # @return [Vapi::CloneVoiceDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      description = parsed_json["description"]
      labels = parsed_json["labels"]
      files = parsed_json["files"]
      new(
        name: name,
        description: description,
        labels: labels,
        files: files,
        additional_properties: struct
      )
    end

    # Serialize an instance of CloneVoiceDto to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.labels&.is_a?(String) != false || raise("Passed value for field obj.labels is not the expected type, validation failed.")
      obj.files.is_a?(Array) != false || raise("Passed value for field obj.files is not the expected type, validation failed.")
    end
  end
end
