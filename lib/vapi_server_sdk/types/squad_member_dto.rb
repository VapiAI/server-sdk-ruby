# frozen_string_literal: true

require_relative "squad_member_dto_assistant_destinations_item"
require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require "ostruct"
require "json"

module Vapi
  class SquadMemberDto
    # @return [Array<Vapi::SquadMemberDtoAssistantDestinationsItem>]
    attr_reader :assistant_destinations
    # @return [String] This is the assistant that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    attr_reader :assistant_id
    # @return [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    attr_reader :assistant
    # @return [Vapi::AssistantOverrides] This can be used to override the assistant's settings and provide values for
    #  it's template variables.
    attr_reader :assistant_overrides
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param assistant_destinations [Array<Vapi::SquadMemberDtoAssistantDestinationsItem>]
    # @param assistant_id [String] This is the assistant that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    # @param assistant_overrides [Vapi::AssistantOverrides] This can be used to override the assistant's settings and provide values for
    #  it's template variables.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SquadMemberDto]
    def initialize(assistant_destinations: OMIT, assistant_id: OMIT, assistant: OMIT, assistant_overrides: OMIT,
                   additional_properties: nil)
      @assistant_destinations = assistant_destinations if assistant_destinations != OMIT
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "assistantDestinations": assistant_destinations,
        "assistantId": assistant_id,
        "assistant": assistant,
        "assistantOverrides": assistant_overrides
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SquadMemberDto
    #
    # @param json_object [String]
    # @return [Vapi::SquadMemberDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      assistant_destinations = parsed_json["assistantDestinations"]&.map do |item|
        item = item.to_json
        Vapi::SquadMemberDtoAssistantDestinationsItem.from_json(json_object: item)
      end
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
      new(
        assistant_destinations: assistant_destinations,
        assistant_id: assistant_id,
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        additional_properties: struct
      )
    end

    # Serialize an instance of SquadMemberDto to a JSON object
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
      obj.assistant_destinations&.is_a?(Array) != false || raise("Passed value for field obj.assistant_destinations is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
    end
  end
end
