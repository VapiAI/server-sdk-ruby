# frozen_string_literal: true
require_relative "squad_member_dto"
require_relative "assistant_overrides"
require "date"
require "date"
require "ostruct"
require "json"

module Vapi
  class Squad
  # @return [String] This is the name of the squad.
    attr_reader :name
  # @return [Array<Vapi::SquadMemberDto>] This is the list of assistants that make up the squad.
#  The call will start with the first assistant in the list.
    attr_reader :members
  # @return [Vapi::AssistantOverrides] This can be used to override all the assistants' settings and provide values for
#  their template variables.
#  Both `membersOverrides` and `members[n].assistantOverrides` can be used
#  together. First, `members[n].assistantOverrides` is applied. Then,
#  `membersOverrides` is applied as a global override.
    attr_reader :members_overrides
  # @return [String] This is the unique identifier for the squad.
    attr_reader :id
  # @return [String] This is the unique identifier for the org that this squad belongs to.
    attr_reader :org_id
  # @return [DateTime] This is the ISO 8601 date-time string of when the squad was created.
    attr_reader :created_at
  # @return [DateTime] This is the ISO 8601 date-time string of when the squad was last updated.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] This is the name of the squad.
    # @param members [Array<Vapi::SquadMemberDto>] This is the list of assistants that make up the squad.
#  The call will start with the first assistant in the list.
    # @param members_overrides [Vapi::AssistantOverrides] This can be used to override all the assistants' settings and provide values for
#  their template variables.
#  Both `membersOverrides` and `members[n].assistantOverrides` can be used
#  together. First, `members[n].assistantOverrides` is applied. Then,
#  `membersOverrides` is applied as a global override.
    # @param id [String] This is the unique identifier for the squad.
    # @param org_id [String] This is the unique identifier for the org that this squad belongs to.
    # @param created_at [DateTime] This is the ISO 8601 date-time string of when the squad was created.
    # @param updated_at [DateTime] This is the ISO 8601 date-time string of when the squad was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Squad]
    def initialize(name: OMIT, members:, members_overrides: OMIT, id:, org_id:, created_at:, updated_at:, additional_properties: nil)
      @name = name if name != OMIT
      @members = members
      @members_overrides = members_overrides if members_overrides != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = { "name": name, "members": members, "membersOverrides": members_overrides, "id": id, "orgId": org_id, "createdAt": created_at, "updatedAt": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Squad
    #
    # @param json_object [String] 
    # @return [Vapi::Squad]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      members = parsed_json["members"]&.map do | item |
  item = item.to_json
  Vapi::SquadMemberDto.from_json(json_object: item)
end
      unless parsed_json["membersOverrides"].nil?
        members_overrides = parsed_json["membersOverrides"].to_json
        members_overrides = Vapi::AssistantOverrides.from_json(json_object: members_overrides)
      else
        members_overrides = nil
      end
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = unless parsed_json["createdAt"].nil?
  DateTime.parse(parsed_json["createdAt"])
else
  nil
end
      updated_at = unless parsed_json["updatedAt"].nil?
  DateTime.parse(parsed_json["updatedAt"])
else
  nil
end
      new(
        name: name,
        members: members,
        members_overrides: members_overrides,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of Squad to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.members.is_a?(Array) != false || raise("Passed value for field obj.members is not the expected type, validation failed.")
      obj.members_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.members_overrides)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end