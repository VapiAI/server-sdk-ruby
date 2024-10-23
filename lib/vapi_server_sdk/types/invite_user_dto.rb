# frozen_string_literal: true

require_relative "invite_user_dto_role"
require "ostruct"
require "json"

module Vapi
  class InviteUserDto
    # @return [String]
    attr_reader :email
    # @return [Vapi::InviteUserDtoRole]
    attr_reader :role
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [String]
    # @param role [Vapi::InviteUserDtoRole]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InviteUserDto]
    def initialize(email:, role:, additional_properties: nil)
      @email = email
      @role = role
      @additional_properties = additional_properties
      @_field_set = { "email": email, "role": role }
    end

    # Deserialize a JSON object to an instance of InviteUserDto
    #
    # @param json_object [String]
    # @return [Vapi::InviteUserDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email = parsed_json["email"]
      role = parsed_json["role"]
      new(
        email: email,
        role: role,
        additional_properties: struct
      )
    end

    # Serialize an instance of InviteUserDto to a JSON object
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
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::InviteUserDtoRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
    end
  end
end
