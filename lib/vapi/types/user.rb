# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Vapi
  class User
    # @return [String] This is the unique identifier for the profile or user.
    attr_reader :id
    # @return [DateTime] This is the ISO 8601 date-time string of when the profile was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the profile was last updated.
    attr_reader :updated_at
    # @return [String] This is the email of the user that is associated with the profile.
    attr_reader :email
    # @return [String] This is the full name of the user that is associated with the profile.
    attr_reader :full_name
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] This is the unique identifier for the profile or user.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the profile was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the profile was last updated.
    # @param email [String] This is the email of the user that is associated with the profile.
    # @param full_name [String] This is the full name of the user that is associated with the profile.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::User]
    def initialize(id:, created_at:, updated_at:, email:, full_name: OMIT, additional_properties: nil)
      @id = id
      @created_at = created_at
      @updated_at = updated_at
      @email = email
      @full_name = full_name if full_name != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "id": id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "email": email,
        "fullName": full_name
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of User
    #
    # @param json_object [String]
    # @return [Vapi::User]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      email = parsed_json["email"]
      full_name = parsed_json["fullName"]
      new(
        id: id,
        created_at: created_at,
        updated_at: updated_at,
        email: email,
        full_name: full_name,
        additional_properties: struct
      )
    end

    # Serialize an instance of User to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.full_name&.is_a?(String) != false || raise("Passed value for field obj.full_name is not the expected type, validation failed.")
    end
  end
end
