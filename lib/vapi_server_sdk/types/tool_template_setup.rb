# frozen_string_literal: true

require "ostruct"
require "json"

module Vapi
  class ToolTemplateSetup
    # @return [String]
    attr_reader :title
    # @return [String]
    attr_reader :description
    # @return [String]
    attr_reader :video_url
    # @return [String]
    attr_reader :docs_url
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String]
    # @param description [String]
    # @param video_url [String]
    # @param docs_url [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::ToolTemplateSetup]
    def initialize(title:, description: OMIT, video_url: OMIT, docs_url: OMIT, additional_properties: nil)
      @title = title
      @description = description if description != OMIT
      @video_url = video_url if video_url != OMIT
      @docs_url = docs_url if docs_url != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "title": title,
        "description": description,
        "videoUrl": video_url,
        "docsUrl": docs_url
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of ToolTemplateSetup
    #
    # @param json_object [String]
    # @return [Vapi::ToolTemplateSetup]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      description = parsed_json["description"]
      video_url = parsed_json["videoUrl"]
      docs_url = parsed_json["docsUrl"]
      new(
        title: title,
        description: description,
        video_url: video_url,
        docs_url: docs_url,
        additional_properties: struct
      )
    end

    # Serialize an instance of ToolTemplateSetup to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.video_url&.is_a?(String) != false || raise("Passed value for field obj.video_url is not the expected type, validation failed.")
      obj.docs_url&.is_a?(String) != false || raise("Passed value for field obj.docs_url is not the expected type, validation failed.")
    end
  end
end
