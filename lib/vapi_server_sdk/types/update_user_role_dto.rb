# frozen_string_literal: true
require_relative "update_user_role_dto_role"
require "ostruct"
require "json"

module Vapi
  class UpdateUserRoleDto
  # @return [String] 
    attr_reader :user_id
  # @return [Vapi::UpdateUserRoleDtoRole] 
    attr_reader :role
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param user_id [String] 
    # @param role [Vapi::UpdateUserRoleDtoRole] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateUserRoleDto]
    def initialize(user_id:, role:, additional_properties: nil)
      @user_id = user_id
      @role = role
      @additional_properties = additional_properties
      @_field_set = { "userId": user_id, "role": role }
    end
# Deserialize a JSON object to an instance of UpdateUserRoleDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateUserRoleDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      user_id = parsed_json["userId"]
      role = parsed_json["role"]
      new(
        user_id: user_id,
        role: role,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateUserRoleDto to a JSON object
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
      obj.user_id.is_a?(String) != false || raise("Passed value for field obj.user_id is not the expected type, validation failed.")
      obj.role.is_a?(Vapi::UpdateUserRoleDtoRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
    end
  end
end