# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class RecordingConsent
    # @return [Hash{String => Object}] This is the type of recording consent.
    attr_reader :type
    # @return [DateTime] This is the date and time the recording consent was granted.
    #  If not specified, it means the recording consent was not granted.
    attr_reader :granted_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [Hash{String => Object}] This is the type of recording consent.
    # @param granted_at [DateTime] This is the date and time the recording consent was granted.
    #  If not specified, it means the recording consent was not granted.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RecordingConsent]
    def initialize(type:, granted_at: OMIT, additional_properties: nil)
      @type = type
      @granted_at = granted_at if granted_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "grantedAt": granted_at }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RecordingConsent
    #
    # @param json_object [String]
    # @return [Vapi::RecordingConsent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      granted_at = (DateTime.parse(parsed_json["grantedAt"]) unless parsed_json["grantedAt"].nil?)
      new(
        type: type,
        granted_at: granted_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of RecordingConsent to a JSON object
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
      obj.type.is_a?(Hash) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.granted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.granted_at is not the expected type, validation failed.")
    end
  end
end
