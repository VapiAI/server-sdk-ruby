# frozen_string_literal: true

require_relative "token_tag"
require "date"
require_relative "token_restrictions"
require "ostruct"
require "json"

module Vapi
  class Token
    # @return [Vapi::TokenTag] This is the tag for the token. It represents its scope.
    attr_reader :tag
    # @return [String] This is the unique identifier for the token.
    attr_reader :id
    # @return [String] This is unique identifier for the org that this token belongs to.
    attr_reader :org_id
    # @return [DateTime] This is the ISO 8601 date-time string of when the token was created.
    attr_reader :created_at
    # @return [DateTime] This is the ISO 8601 date-time string of when the token was last updated.
    attr_reader :updated_at
    # @return [String] This is the token key.
    attr_reader :value
    # @return [String] This is the name of the token. This is just for your own reference.
    attr_reader :name
    # @return [Vapi::TokenRestrictions] This are the restrictions for the token.
    attr_reader :restrictions
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param tag [Vapi::TokenTag] This is the tag for the token. It represents its scope.
    # @param id [String] This is the unique identifier for the token.
    # @param org_id [String] This is unique identifier for the org that this token belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the token was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the token was last updated.
    # @param value [String] This is the token key.
    # @param name [String] This is the name of the token. This is just for your own reference.
    # @param restrictions [Vapi::TokenRestrictions] This are the restrictions for the token.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Token]
    def initialize(id:, org_id:, created_at:, updated_at:, value:, tag: OMIT, name: OMIT, restrictions: OMIT,
                   additional_properties: nil)
      @tag = tag if tag != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @value = value
      @name = name if name != OMIT
      @restrictions = restrictions if restrictions != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "tag": tag,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at,
        "value": value,
        "name": name,
        "restrictions": restrictions
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Token
    #
    # @param json_object [String]
    # @return [Vapi::Token]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      tag = parsed_json["tag"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      value = parsed_json["value"]
      name = parsed_json["name"]
      if parsed_json["restrictions"].nil?
        restrictions = nil
      else
        restrictions = parsed_json["restrictions"].to_json
        restrictions = Vapi::TokenRestrictions.from_json(json_object: restrictions)
      end
      new(
        tag: tag,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        value: value,
        name: name,
        restrictions: restrictions,
        additional_properties: struct
      )
    end

    # Serialize an instance of Token to a JSON object
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
      obj.tag&.is_a?(Vapi::TokenTag) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.restrictions.nil? || Vapi::TokenRestrictions.validate_raw(obj: obj.restrictions)
    end
  end
end
