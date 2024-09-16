# frozen_string_literal: true

require_relative "template_details"
require_relative "template_provider_details"
require_relative "tool_template_metadata"
require_relative "template_visibility"
require_relative "template_provider"
require "date"
require "ostruct"
require "json"

module Vapi
  class Template
    # @return [Vapi::TemplateDetails]
    attr_reader :details
    # @return [Vapi::TemplateProviderDetails]
    attr_reader :provider_details
    # @return [Vapi::ToolTemplateMetadata]
    attr_reader :metadata
    # @return [Vapi::TemplateVisibility]
    attr_reader :visibility
    # @return [String]
    attr_reader :type
    # @return [String] The name of the template. This is just for your own reference.
    attr_reader :name
    # @return [Vapi::TemplateProvider]
    attr_reader :provider
    # @return [String] The unique identifier for the template.
    attr_reader :id
    # @return [String] The unique identifier for the organization that this template belongs to.
    attr_reader :org_id
    # @return [DateTime] The ISO 8601 date-time string of when the template was created.
    attr_reader :created_at
    # @return [DateTime] The ISO 8601 date-time string of when the template was last updated.
    attr_reader :updated_at
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param details [Vapi::TemplateDetails]
    # @param provider_details [Vapi::TemplateProviderDetails]
    # @param metadata [Vapi::ToolTemplateMetadata]
    # @param visibility [Vapi::TemplateVisibility]
    # @param type [String]
    # @param name [String] The name of the template. This is just for your own reference.
    # @param provider [Vapi::TemplateProvider]
    # @param id [String] The unique identifier for the template.
    # @param org_id [String] The unique identifier for the organization that this template belongs to.
    # @param created_at [DateTime] The ISO 8601 date-time string of when the template was created.
    # @param updated_at [DateTime] The ISO 8601 date-time string of when the template was last updated.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Template]
    def initialize(type:, id:, org_id:, created_at:, updated_at:, details: OMIT, provider_details: OMIT, metadata: OMIT, visibility: OMIT, name: OMIT,
                   provider: OMIT, additional_properties: nil)
      @details = details if details != OMIT
      @provider_details = provider_details if provider_details != OMIT
      @metadata = metadata if metadata != OMIT
      @visibility = visibility if visibility != OMIT
      @type = type
      @name = name if name != OMIT
      @provider = provider if provider != OMIT
      @id = id
      @org_id = org_id
      @created_at = created_at
      @updated_at = updated_at
      @additional_properties = additional_properties
      @_field_set = {
        "details": details,
        "providerDetails": provider_details,
        "metadata": metadata,
        "visibility": visibility,
        "type": type,
        "name": name,
        "provider": provider,
        "id": id,
        "orgId": org_id,
        "createdAt": created_at,
        "updatedAt": updated_at
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Template
    #
    # @param json_object [String]
    # @return [Vapi::Template]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["details"].nil?
        details = nil
      else
        details = parsed_json["details"].to_json
        details = Vapi::TemplateDetails.from_json(json_object: details)
      end
      if parsed_json["providerDetails"].nil?
        provider_details = nil
      else
        provider_details = parsed_json["providerDetails"].to_json
        provider_details = Vapi::TemplateProviderDetails.from_json(json_object: provider_details)
      end
      if parsed_json["metadata"].nil?
        metadata = nil
      else
        metadata = parsed_json["metadata"].to_json
        metadata = Vapi::ToolTemplateMetadata.from_json(json_object: metadata)
      end
      visibility = parsed_json["visibility"]
      type = parsed_json["type"]
      name = parsed_json["name"]
      provider = parsed_json["provider"]
      id = parsed_json["id"]
      org_id = parsed_json["orgId"]
      created_at = (DateTime.parse(parsed_json["createdAt"]) unless parsed_json["createdAt"].nil?)
      updated_at = (DateTime.parse(parsed_json["updatedAt"]) unless parsed_json["updatedAt"].nil?)
      new(
        details: details,
        provider_details: provider_details,
        metadata: metadata,
        visibility: visibility,
        type: type,
        name: name,
        provider: provider,
        id: id,
        org_id: org_id,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end

    # Serialize an instance of Template to a JSON object
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
      obj.details.nil? || Vapi::TemplateDetails.validate_raw(obj: obj.details)
      obj.provider_details.nil? || Vapi::TemplateProviderDetails.validate_raw(obj: obj.provider_details)
      obj.metadata.nil? || Vapi::ToolTemplateMetadata.validate_raw(obj: obj.metadata)
      obj.visibility&.is_a?(Vapi::TemplateVisibility) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.provider&.is_a?(Vapi::TemplateProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.org_id.is_a?(String) != false || raise("Passed value for field obj.org_id is not the expected type, validation failed.")
      obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end
