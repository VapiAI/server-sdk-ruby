# frozen_string_literal: true

require_relative "update_token_dto_tag"
require_relative "token_restrictions"
require "ostruct"
require "json"

module Vapi
  class UpdateTokenDto
    # @return [Vapi::UpdateTokenDtoTag] This is the tag for the token. It represents its scope.
    attr_reader :tag
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

    # @param tag [Vapi::UpdateTokenDtoTag] This is the tag for the token. It represents its scope.
    # @param name [String] This is the name of the token. This is just for your own reference.
    # @param restrictions [Vapi::TokenRestrictions] This are the restrictions for the token.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateTokenDto]
    def initialize(tag: OMIT, name: OMIT, restrictions: OMIT, additional_properties: nil)
      @tag = tag if tag != OMIT
      @name = name if name != OMIT
      @restrictions = restrictions if restrictions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "tag": tag, "name": name, "restrictions": restrictions }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateTokenDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateTokenDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      tag = parsed_json["tag"]
      name = parsed_json["name"]
      if parsed_json["restrictions"].nil?
        restrictions = nil
      else
        restrictions = parsed_json["restrictions"].to_json
        restrictions = Vapi::TokenRestrictions.from_json(json_object: restrictions)
      end
      new(
        tag: tag,
        name: name,
        restrictions: restrictions,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateTokenDto to a JSON object
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
      obj.tag&.is_a?(Vapi::UpdateTokenDtoTag) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.restrictions.nil? || Vapi::TokenRestrictions.validate_raw(obj: obj.restrictions)
    end
  end
end
