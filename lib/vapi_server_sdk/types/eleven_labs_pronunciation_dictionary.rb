# frozen_string_literal: true

require_relative "eleven_labs_pronunciation_dictionary_permission_on_resource"
require "ostruct"
require "json"

module Vapi
  class ElevenLabsPronunciationDictionary
    # @return [String] The ID of the pronunciation dictionary
    attr_reader :pronunciation_dictionary_id
    # @return [String] The name of the pronunciation dictionary
    attr_reader :dictionary_name
    # @return [String] The user ID of the creator
    attr_reader :created_by
    # @return [Float] The creation time in Unix timestamp
    attr_reader :creation_time_unix
    # @return [String] The version ID of the pronunciation dictionary
    attr_reader :version_id
    # @return [Float] The number of rules in this version
    attr_reader :version_rules_num
    # @return [Vapi::ElevenLabsPronunciationDictionaryPermissionOnResource] The permission level on this resource
    attr_reader :permission_on_resource
    # @return [String] The description of the pronunciation dictionary
    attr_reader :description
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param pronunciation_dictionary_id [String] The ID of the pronunciation dictionary
    # @param dictionary_name [String] The name of the pronunciation dictionary
    # @param created_by [String] The user ID of the creator
    # @param creation_time_unix [Float] The creation time in Unix timestamp
    # @param version_id [String] The version ID of the pronunciation dictionary
    # @param version_rules_num [Float] The number of rules in this version
    # @param permission_on_resource [Vapi::ElevenLabsPronunciationDictionaryPermissionOnResource] The permission level on this resource
    # @param description [String] The description of the pronunciation dictionary
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ElevenLabsPronunciationDictionary]
    def initialize(pronunciation_dictionary_id:, dictionary_name:, created_by:, creation_time_unix:, version_id:,
                   version_rules_num:, permission_on_resource: OMIT, description: OMIT, additional_properties: nil)
      @pronunciation_dictionary_id = pronunciation_dictionary_id
      @dictionary_name = dictionary_name
      @created_by = created_by
      @creation_time_unix = creation_time_unix
      @version_id = version_id
      @version_rules_num = version_rules_num
      @permission_on_resource = permission_on_resource if permission_on_resource != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "pronunciationDictionaryId": pronunciation_dictionary_id,
        "dictionaryName": dictionary_name,
        "createdBy": created_by,
        "creationTimeUnix": creation_time_unix,
        "versionId": version_id,
        "versionRulesNum": version_rules_num,
        "permissionOnResource": permission_on_resource,
        "description": description
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ElevenLabsPronunciationDictionary
    #
    # @param json_object [String]
    # @return [Vapi::ElevenLabsPronunciationDictionary]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      pronunciation_dictionary_id = parsed_json["pronunciationDictionaryId"]
      dictionary_name = parsed_json["dictionaryName"]
      created_by = parsed_json["createdBy"]
      creation_time_unix = parsed_json["creationTimeUnix"]
      version_id = parsed_json["versionId"]
      version_rules_num = parsed_json["versionRulesNum"]
      permission_on_resource = parsed_json["permissionOnResource"]
      description = parsed_json["description"]
      new(
        pronunciation_dictionary_id: pronunciation_dictionary_id,
        dictionary_name: dictionary_name,
        created_by: created_by,
        creation_time_unix: creation_time_unix,
        version_id: version_id,
        version_rules_num: version_rules_num,
        permission_on_resource: permission_on_resource,
        description: description,
        additional_properties: struct
      )
    end

    # Serialize an instance of ElevenLabsPronunciationDictionary to a JSON object
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
      obj.pronunciation_dictionary_id.is_a?(String) != false || raise("Passed value for field obj.pronunciation_dictionary_id is not the expected type, validation failed.")
      obj.dictionary_name.is_a?(String) != false || raise("Passed value for field obj.dictionary_name is not the expected type, validation failed.")
      obj.created_by.is_a?(String) != false || raise("Passed value for field obj.created_by is not the expected type, validation failed.")
      obj.creation_time_unix.is_a?(Float) != false || raise("Passed value for field obj.creation_time_unix is not the expected type, validation failed.")
      obj.version_id.is_a?(String) != false || raise("Passed value for field obj.version_id is not the expected type, validation failed.")
      obj.version_rules_num.is_a?(Float) != false || raise("Passed value for field obj.version_rules_num is not the expected type, validation failed.")
      obj.permission_on_resource&.is_a?(Vapi::ElevenLabsPronunciationDictionaryPermissionOnResource) != false || raise("Passed value for field obj.permission_on_resource is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end
