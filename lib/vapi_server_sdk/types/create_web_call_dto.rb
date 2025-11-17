# frozen_string_literal: true

require_relative "create_assistant_dto"
require_relative "assistant_overrides"
require_relative "create_squad_dto"
require_relative "create_workflow_dto"
require_relative "workflow_overrides"
require "ostruct"
require "json"

module Vapi
  class CreateWebCallDto
    # @return [Boolean]
    attr_reader :room_delete_on_user_leave_enabled
    # @return [String] This is the assistant ID that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    #  To start a call with:
    #  - Assistant, use `assistantId` or `assistant`
    #  - Squad, use `squadId` or `squad`
    #  - Workflow, use `workflowId` or `workflow`
    attr_reader :assistant_id
    # @return [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant`
    #  - Squad, use `squad`
    #  - Workflow, use `workflow`
    attr_reader :assistant
    # @return [Vapi::AssistantOverrides] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.
    attr_reader :assistant_overrides
    # @return [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    attr_reader :squad_id
    # @return [Vapi::CreateSquadDto] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    attr_reader :squad
    # @return [Vapi::AssistantOverrides] These are the overrides for the `squad` or `squadId`'s member settings and
    #  template variables.
    #  This will apply to all members of the squad.
    attr_reader :squad_overrides
    # @return [String] This is the workflow that will be used for the call. To use a transient
    #  workflow, use `workflow` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    attr_reader :workflow_id
    # @return [Vapi::CreateWorkflowDto] This is a workflow that will be used for the call. To use an existing workflow,
    #  use `workflowId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    attr_reader :workflow
    # @return [Vapi::WorkflowOverrides] These are the overrides for the `workflow` or `workflowId`'s settings and
    #  template variables.
    attr_reader :workflow_overrides
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param room_delete_on_user_leave_enabled [Boolean]
    # @param assistant_id [String] This is the assistant ID that will be used for the call. To use a transient
    #  assistant, use `assistant` instead.
    #  To start a call with:
    #  - Assistant, use `assistantId` or `assistant`
    #  - Squad, use `squadId` or `squad`
    #  - Workflow, use `workflowId` or `workflow`
    # @param assistant [Vapi::CreateAssistantDto] This is the assistant that will be used for the call. To use an existing
    #  assistant, use `assistantId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant`
    #  - Squad, use `squad`
    #  - Workflow, use `workflow`
    # @param assistant_overrides [Vapi::AssistantOverrides] These are the overrides for the `assistant` or `assistantId`'s settings and
    #  template variables.
    # @param squad_id [String] This is the squad that will be used for the call. To use a transient squad, use
    #  `squad` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param squad [Vapi::CreateSquadDto] This is a squad that will be used for the call. To use an existing squad, use
    #  `squadId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param squad_overrides [Vapi::AssistantOverrides] These are the overrides for the `squad` or `squadId`'s member settings and
    #  template variables.
    #  This will apply to all members of the squad.
    # @param workflow_id [String] This is the workflow that will be used for the call. To use a transient
    #  workflow, use `workflow` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param workflow [Vapi::CreateWorkflowDto] This is a workflow that will be used for the call. To use an existing workflow,
    #  use `workflowId` instead.
    #  To start a call with:
    #  - Assistant, use `assistant` or `assistantId`
    #  - Squad, use `squad` or `squadId`
    #  - Workflow, use `workflow` or `workflowId`
    # @param workflow_overrides [Vapi::WorkflowOverrides] These are the overrides for the `workflow` or `workflowId`'s settings and
    #  template variables.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateWebCallDto]
    def initialize(room_delete_on_user_leave_enabled: OMIT, assistant_id: OMIT, assistant: OMIT,
                   assistant_overrides: OMIT, squad_id: OMIT, squad: OMIT, squad_overrides: OMIT, workflow_id: OMIT, workflow: OMIT, workflow_overrides: OMIT, additional_properties: nil)
      if room_delete_on_user_leave_enabled != OMIT
        @room_delete_on_user_leave_enabled = room_delete_on_user_leave_enabled
      end
      @assistant_id = assistant_id if assistant_id != OMIT
      @assistant = assistant if assistant != OMIT
      @assistant_overrides = assistant_overrides if assistant_overrides != OMIT
      @squad_id = squad_id if squad_id != OMIT
      @squad = squad if squad != OMIT
      @squad_overrides = squad_overrides if squad_overrides != OMIT
      @workflow_id = workflow_id if workflow_id != OMIT
      @workflow = workflow if workflow != OMIT
      @workflow_overrides = workflow_overrides if workflow_overrides != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "roomDeleteOnUserLeaveEnabled": room_delete_on_user_leave_enabled,
        "assistantId": assistant_id,
        "assistant": assistant,
        "assistantOverrides": assistant_overrides,
        "squadId": squad_id,
        "squad": squad,
        "squadOverrides": squad_overrides,
        "workflowId": workflow_id,
        "workflow": workflow,
        "workflowOverrides": workflow_overrides
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
      room_delete_on_user_leave_enabled = parsed_json["roomDeleteOnUserLeaveEnabled"]
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
      if parsed_json["squadOverrides"].nil?
        squad_overrides = nil
      else
        squad_overrides = parsed_json["squadOverrides"].to_json
        squad_overrides = Vapi::AssistantOverrides.from_json(json_object: squad_overrides)
      end
      workflow_id = parsed_json["workflowId"]
      if parsed_json["workflow"].nil?
        workflow = nil
      else
        workflow = parsed_json["workflow"].to_json
        workflow = Vapi::CreateWorkflowDto.from_json(json_object: workflow)
      end
      if parsed_json["workflowOverrides"].nil?
        workflow_overrides = nil
      else
        workflow_overrides = parsed_json["workflowOverrides"].to_json
        workflow_overrides = Vapi::WorkflowOverrides.from_json(json_object: workflow_overrides)
      end
      new(
        room_delete_on_user_leave_enabled: room_delete_on_user_leave_enabled,
        assistant_id: assistant_id,
        assistant: assistant,
        assistant_overrides: assistant_overrides,
        squad_id: squad_id,
        squad: squad,
        squad_overrides: squad_overrides,
        workflow_id: workflow_id,
        workflow: workflow,
        workflow_overrides: workflow_overrides,
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
      obj.room_delete_on_user_leave_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.room_delete_on_user_leave_enabled is not the expected type, validation failed.")
      obj.assistant_id&.is_a?(String) != false || raise("Passed value for field obj.assistant_id is not the expected type, validation failed.")
      obj.assistant.nil? || Vapi::CreateAssistantDto.validate_raw(obj: obj.assistant)
      obj.assistant_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.assistant_overrides)
      obj.squad_id&.is_a?(String) != false || raise("Passed value for field obj.squad_id is not the expected type, validation failed.")
      obj.squad.nil? || Vapi::CreateSquadDto.validate_raw(obj: obj.squad)
      obj.squad_overrides.nil? || Vapi::AssistantOverrides.validate_raw(obj: obj.squad_overrides)
      obj.workflow_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_id is not the expected type, validation failed.")
      obj.workflow.nil? || Vapi::CreateWorkflowDto.validate_raw(obj: obj.workflow)
      obj.workflow_overrides.nil? || Vapi::WorkflowOverrides.validate_raw(obj: obj.workflow_overrides)
    end
  end
end
