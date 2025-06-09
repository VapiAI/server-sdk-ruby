# frozen_string_literal: true
require_relative "invite_user_dto_role"
require "ostruct"
require "json"

module Vapi
  class InviteUserDto
  # @return [Array<String>] 
    attr_reader :emails
  # @return [Vapi::InviteUserDtoRole] 
    attr_reader :role
  # @return [String] 
    attr_reader :redirect_to
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param emails [Array<String>] 
    # @param role [Vapi::InviteUserDtoRole] 
    # @param redirect_to [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::InviteUserDto]
    def initialize(emails:, role:, redirect_to: OMIT, additional_properties: nil)
      @emails = emails
      @role = role
      @redirect_to = redirect_to if redirect_to != OMIT
      @additional_properties = additional_properties
      @_field_set = { "emails": emails, "role": role, "redirectTo": redirect_to }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InviteUserDto
    #
    # @param json_object [String] 
    # @return [Vapi::InviteUserDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      emails = parsed_json["emails"]
      role = parsed_json["role"]
      redirect_to = parsed_json["redirectTo"]
      new(
        emails: emails,
        role: role,
        redirect_to: redirect_to,
        additional_properties: struct
      )
    end
# Serialize an instance of InviteUserDto to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.emails.is_a?(Array) != false || raise("Passed value for field obj.emails is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::InviteUserDtoRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.redirect_to&.is_a?(String) != false || raise("Passed value for field obj.redirect_to is not the expected type, validation failed.")
    end
  end
end