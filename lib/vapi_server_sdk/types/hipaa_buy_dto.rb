# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class HipaaBuyDto
    # @return [String] This is the name of the recipient.
    attr_reader :recipient_name
    # @return [String] This is the name of the recipient organization.
    attr_reader :recipient_organization
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param recipient_name [String] This is the name of the recipient.
    # @param recipient_organization [String] This is the name of the recipient organization.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::HipaaBuyDto]
    def initialize(recipient_name:, recipient_organization:, additional_properties: nil)
      @recipient_name = recipient_name
      @recipient_organization = recipient_organization
      @additional_properties = additional_properties
      @_field_set = { "recipientName": recipient_name, "recipientOrganization": recipient_organization }
    end

    # Deserialize a JSON object to an instance of HipaaBuyDto
    #
    # @param json_object [String]
    # @return [Vapi::HipaaBuyDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      recipient_name = parsed_json["recipientName"]
      recipient_organization = parsed_json["recipientOrganization"]
      new(
        recipient_name: recipient_name,
        recipient_organization: recipient_organization,
        additional_properties: struct
      )
    end

    # Serialize an instance of HipaaBuyDto to a JSON object
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
      obj.recipient_name.is_a?(String) != false || raise("Passed value for field obj.recipient_name is not the expected type, validation failed.")
      obj.recipient_organization.is_a?(String) != false || raise("Passed value for field obj.recipient_organization is not the expected type, validation failed.")
    end
  end
end
