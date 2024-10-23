# frozen_string_literal: true

require_relative "update_tool_template_dto_details"
require_relative "update_tool_template_dto_provider_details"
require_relative "tool_template_metadata"
require_relative "update_tool_template_dto_visibility"
require_relative "update_tool_template_dto_provider"
require "ostruct"
require "json"

module Vapi
  class UpdateToolTemplateDto
    # @return [Vapi::UpdateToolTemplateDtoDetails]
    attr_reader :details
    # @return [Vapi::UpdateToolTemplateDtoProviderDetails]
    attr_reader :provider_details
    # @return [Vapi::ToolTemplateMetadata]
    attr_reader :metadata
    # @return [Vapi::UpdateToolTemplateDtoVisibility]
    attr_reader :visibility
    # @return [String]
    attr_reader :type
    # @return [String] The name of the template. This is just for your own reference.
    attr_reader :name
    # @return [Vapi::UpdateToolTemplateDtoProvider]
    attr_reader :provider
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param details [Vapi::UpdateToolTemplateDtoDetails]
    # @param provider_details [Vapi::UpdateToolTemplateDtoProviderDetails]
    # @param metadata [Vapi::ToolTemplateMetadata]
    # @param visibility [Vapi::UpdateToolTemplateDtoVisibility]
    # @param type [String]
    # @param name [String] The name of the template. This is just for your own reference.
    # @param provider [Vapi::UpdateToolTemplateDtoProvider]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateToolTemplateDto]
    def initialize(type:, details: OMIT, provider_details: OMIT, metadata: OMIT, visibility: OMIT, name: OMIT,
                   provider: OMIT, additional_properties: nil)
      @details = details if details != OMIT
      @provider_details = provider_details if provider_details != OMIT
      @metadata = metadata if metadata != OMIT
      @visibility = visibility if visibility != OMIT
      @type = type
      @name = name if name != OMIT
      @provider = provider if provider != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "details": details,
        "providerDetails": provider_details,
        "metadata": metadata,
        "visibility": visibility,
        "type": type,
        "name": name,
        "provider": provider
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateToolTemplateDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateToolTemplateDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["details"].nil?
        details = nil
      else
        details = parsed_json["details"].to_json
        details = Vapi::UpdateToolTemplateDtoDetails.from_json(json_object: details)
      end
      if parsed_json["providerDetails"].nil?
        provider_details = nil
      else
        provider_details = parsed_json["providerDetails"].to_json
        provider_details = Vapi::UpdateToolTemplateDtoProviderDetails.from_json(json_object: provider_details)
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
      new(
        details: details,
        provider_details: provider_details,
        metadata: metadata,
        visibility: visibility,
        type: type,
        name: name,
        provider: provider,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateToolTemplateDto to a JSON object
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
      obj.details.nil? || Vapi::UpdateToolTemplateDtoDetails.validate_raw(obj: obj.details)
      obj.provider_details.nil? || Vapi::UpdateToolTemplateDtoProviderDetails.validate_raw(obj: obj.provider_details)
      obj.metadata.nil? || Vapi::ToolTemplateMetadata.validate_raw(obj: obj.metadata)
      obj.visibility&.is_a?(Vapi::UpdateToolTemplateDtoVisibility) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.provider&.is_a?(Vapi::UpdateToolTemplateDtoProvider) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
    end
  end
end
