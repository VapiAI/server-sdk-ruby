# frozen_string_literal: true

require_relative "create_structured_output_dto_model"
require_relative "compliance_override"
require_relative "json_schema"
require "ostruct"
require "json"

module Vapi
  class CreateStructuredOutputDto
    # @return [Vapi::CreateStructuredOutputDtoModel] This is the model that will be used to extract the structured output.
    #  To provide your own custom system and user prompts for structured output
    #  extraction, populate the messages array with your system and user messages. You
    #  can specify liquid templating in your system and user messages.
    #  Between the system or user messages, you must reference either 'transcript' or
    #  'messages' with the '{{}}' syntax to access the conversation history.
    #  Between the system or user messages, you must reference a variation of the
    #  structured output with the '{{}}' syntax to access the structured output
    #  definition.
    #  i.e.:
    #  {{structuredOutput}}
    #  {{structuredOutput.name}}
    #  {{structuredOutput.description}}
    #  {{structuredOutput.schema}}
    #  If model is not specified, GPT-4.1 will be used by default for extraction,
    #  utilizing default system and user prompts.
    #  If messages or required fields are not specified, the default system and user
    #  prompts will be used.
    attr_reader :model
    # @return [Vapi::ComplianceOverride] Compliance configuration for this output. Only enable overrides if no sensitive
    #  data will be stored.
    attr_reader :compliance_plan
    # @return [String] This is the name of the structured output.
    attr_reader :name
    # @return [Vapi::JsonSchema] This is the JSON Schema definition for the structured output.
    #  This is required when creating a structured output. Defines the structure and
    #  validation rules for the data that will be extracted. Supports all JSON Schema
    #  features including:
    #  - Objects and nested properties
    #  - Arrays and array validation
    #  - String, number, boolean, and null types
    #  - Enums and const values
    #  - Validation constraints (min/max, patterns, etc.)
    #  - Composition with allOf, anyOf, oneOf
    attr_reader :schema
    # @return [String] This is the description of what the structured output extracts.
    #  Use this to provide context about what data will be extracted and how it will be
    #  used.
    attr_reader :description
    # @return [Array<String>] These are the assistant IDs that this structured output is linked to.
    #  When linked to assistants, this structured output will be available for
    #  extraction during those assistant's calls.
    attr_reader :assistant_ids
    # @return [Array<String>] These are the workflow IDs that this structured output is linked to.
    #  When linked to workflows, this structured output will be available for
    #  extraction during those workflow's execution.
    attr_reader :workflow_ids
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model [Vapi::CreateStructuredOutputDtoModel] This is the model that will be used to extract the structured output.
    #  To provide your own custom system and user prompts for structured output
    #  extraction, populate the messages array with your system and user messages. You
    #  can specify liquid templating in your system and user messages.
    #  Between the system or user messages, you must reference either 'transcript' or
    #  'messages' with the '{{}}' syntax to access the conversation history.
    #  Between the system or user messages, you must reference a variation of the
    #  structured output with the '{{}}' syntax to access the structured output
    #  definition.
    #  i.e.:
    #  {{structuredOutput}}
    #  {{structuredOutput.name}}
    #  {{structuredOutput.description}}
    #  {{structuredOutput.schema}}
    #  If model is not specified, GPT-4.1 will be used by default for extraction,
    #  utilizing default system and user prompts.
    #  If messages or required fields are not specified, the default system and user
    #  prompts will be used.
    # @param compliance_plan [Vapi::ComplianceOverride] Compliance configuration for this output. Only enable overrides if no sensitive
    #  data will be stored.
    # @param name [String] This is the name of the structured output.
    # @param schema [Vapi::JsonSchema] This is the JSON Schema definition for the structured output.
    #  This is required when creating a structured output. Defines the structure and
    #  validation rules for the data that will be extracted. Supports all JSON Schema
    #  features including:
    #  - Objects and nested properties
    #  - Arrays and array validation
    #  - String, number, boolean, and null types
    #  - Enums and const values
    #  - Validation constraints (min/max, patterns, etc.)
    #  - Composition with allOf, anyOf, oneOf
    # @param description [String] This is the description of what the structured output extracts.
    #  Use this to provide context about what data will be extracted and how it will be
    #  used.
    # @param assistant_ids [Array<String>] These are the assistant IDs that this structured output is linked to.
    #  When linked to assistants, this structured output will be available for
    #  extraction during those assistant's calls.
    # @param workflow_ids [Array<String>] These are the workflow IDs that this structured output is linked to.
    #  When linked to workflows, this structured output will be available for
    #  extraction during those workflow's execution.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateStructuredOutputDto]
    def initialize(name:, schema:, model: OMIT, compliance_plan: OMIT, description: OMIT, assistant_ids: OMIT,
                   workflow_ids: OMIT, additional_properties: nil)
      @model = model if model != OMIT
      @compliance_plan = compliance_plan if compliance_plan != OMIT
      @name = name
      @schema = schema
      @description = description if description != OMIT
      @assistant_ids = assistant_ids if assistant_ids != OMIT
      @workflow_ids = workflow_ids if workflow_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "model": model,
        "compliancePlan": compliance_plan,
        "name": name,
        "schema": schema,
        "description": description,
        "assistantIds": assistant_ids,
        "workflowIds": workflow_ids
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateStructuredOutputDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateStructuredOutputDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["model"].nil?
        model = nil
      else
        model = parsed_json["model"].to_json
        model = Vapi::CreateStructuredOutputDtoModel.from_json(json_object: model)
      end
      if parsed_json["compliancePlan"].nil?
        compliance_plan = nil
      else
        compliance_plan = parsed_json["compliancePlan"].to_json
        compliance_plan = Vapi::ComplianceOverride.from_json(json_object: compliance_plan)
      end
      name = parsed_json["name"]
      if parsed_json["schema"].nil?
        schema = nil
      else
        schema = parsed_json["schema"].to_json
        schema = Vapi::JsonSchema.from_json(json_object: schema)
      end
      description = parsed_json["description"]
      assistant_ids = parsed_json["assistantIds"]
      workflow_ids = parsed_json["workflowIds"]
      new(
        model: model,
        compliance_plan: compliance_plan,
        name: name,
        schema: schema,
        description: description,
        assistant_ids: assistant_ids,
        workflow_ids: workflow_ids,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateStructuredOutputDto to a JSON object
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
      obj.model.nil? || Vapi::CreateStructuredOutputDtoModel.validate_raw(obj: obj.model)
      obj.compliance_plan.nil? || Vapi::ComplianceOverride.validate_raw(obj: obj.compliance_plan)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Vapi::JsonSchema.validate_raw(obj: obj.schema)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.assistant_ids&.is_a?(Array) != false || raise("Passed value for field obj.assistant_ids is not the expected type, validation failed.")
      obj.workflow_ids&.is_a?(Array) != false || raise("Passed value for field obj.workflow_ids is not the expected type, validation failed.")
    end
  end
end
