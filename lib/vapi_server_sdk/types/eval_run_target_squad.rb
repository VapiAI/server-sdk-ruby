# frozen_string_literal: true

require_relative "create_squad_dto"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class EvalRunTargetSquad
    # @return [Vapi::CreateSquadDto] This is the transient squad that will be run against the eval
    attr_reader :squad
    # @return [Vapi::AssistantOverrides] This is the overrides that will be applied to the assistants.
    attr_reader :assistant_overrides
    # @return [String] This is the id of the squad that will be run against the eval
    attr_reader :squad_id
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param squad [Vapi::CreateSquadDto] This is the transient squad that will be run against the eval
    # @param assistant_overrides [Vapi::AssistantOverrides] This is the overrides that will be applied to the assistants.
    # @param squad_id [String] This is the id of the squad that will be run against the eval
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::EvalRunTargetSquad]
    def initialize(squad: OMIT, assistant_overrides: OMIT, squad_id: OMIT, additional_properties: nil)
      @squad = squad if squad != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "squad": squad,
        "assistantOverrides": assistant_overrides,
        "squadId": squad_id
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of EvalRunTargetSquad
    #
    # @param json_object [String]
    # @return [Vapi::EvalRunTargetSquad]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["squad"].nil?
        squad = nil
      else
        squad = parsed_json["squad"].to_json
        squad = Vapi::CreateSquadDto.from_json(json_object: squad)
      end
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      squad_id = parsed_json["squadId"]
      new(
        squad: squad,
        assistant_overrides: assistant_overrides,
        squad_id: squad_id,
        additional_properties: struct
      )
    end

    # Serialize an instance of EvalRunTargetSquad to a JSON object
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
      obj.squad.nil? || Vapi::CreateSquadDto.validate_raw(obj: obj.squad)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
    end
  end
end
