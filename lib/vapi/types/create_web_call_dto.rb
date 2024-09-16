# frozen_string_literal: true

require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require_relative "create_squad_dto"
require "ostruct"
require "json"

module Vapi
  class CreateWebCallDto
    # @return [String] This is the assistant that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    attr_reader :assistant_id
    # @return [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    attr_reader :assistant
    # @return [Vapi::AssistantOverrides] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.
    attr_reader :assistant_overrides
    # @return [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    attr_reader :squad_id
    # @return [Vapi::CreateSquadDto] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    attr_reader :squad
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assistant_id [String] This is the assistant that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant_overrides [Vapi::AssistantOverrides] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.
    # @param squad_id [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    # @param squad [Vapi::CreateSquadDto] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWebCallDto]
    def initialize(assistant_id: OMIT, assistant: OMIT, assistant_overrides: OMIT, squad_id: OMIT, squad: OMIT,
                   additional_properties: nil)
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @squad = squad if squad != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "assistantId": assistant_id,
        "assistant": assistant,
        "assistantOverrides": assistant_overrides,
        "squadId": squad_id,
        "squad": squad
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateWebCallDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateWebCallDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      assistant_id = parsed_json["assistantId"]
      if parsed_json["assistant"].nil?
        assistant = nil
      else
        assistant = parsed_json["assistant"].to_json
        assistant = Vapi::CreateAssistantDto.from_json(json_object: assistant)
      end
      if parsed_json["assistantOverrides"].nil?
        assistant_overrides = nil
      else
        assistant_overrides = parsed_json["assistantOverrides"].to_json
        assistant_overrides = Vapi::AssistantOverrides.from_json(json_object: assistant_overrides)
      end
      squad_id = parsed_json["squadId"]
      if parsed_json["squad"].nil?
        squad = nil
      else
        squad = parsed_json["squad"].to_json
        squad = Vapi::CreateSquadDto.from_json(json_object: squad)
      end
      new(
        assistant_id: assistant_id,
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        squad_id: squad_id,
        squad: squad,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateWebCallDto to a JSON object
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
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.squad.nil? || Vapi::CreateSquadDto.validate_raw(obj: obj.squad)
    end
  end
end
