# frozen_string_literal: true

require_relative "json_schema"
require_relative "hook"
require "ostruct"
require "json"

module Vapi
  class Gather
    # @return [Vapi::JsonSchema]
    attr_reader :output
    # @return [Boolean] This is whether or not the workflow should read back the gathered data to the
    #  user, and ask about its correctness.
    attr_reader :confirm_content
    # @return [Array<Vapi::Hook>] This is a list of hooks for a task.
    #  Each hook is a list of tasks to run on a trigger (such as on start, on failure,
    #  etc).
    #  Only Say is supported for now.
    attr_reader :hooks
    # @return [Float] This is the number of times we should try to gather the information from the
    #  user before we failover to the fail path. An example of this would be a user
    #  refusing to give their phone number for privacy reasons, and then going down a
    #  different path on account of this
    attr_reader :max_retries
    # @return [String] This is a liquid templating string. On the first call to Gather, the template
    #  will be filled out with variables from the context, and will be spoken verbatim
    #  to the user. An example would be "Base on your zipcode, it looks like you could
    #  be in one of these counties: {{ counties | join: ", " }}. Which one do you live
    #  in?"
    attr_reader :literal_template
    # @return [String]
    attr_reader :name
    # @return [Hash{String => Object}] This is for metadata you want to store on the task.
    attr_reader :metadata
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Vapi::JsonSchema]
    # @param confirm_content [Boolean] This is whether or not the workflow should read back the gathered data to the
    #  user, and ask about its correctness.
    # @param hooks [Array<Vapi::Hook>] This is a list of hooks for a task.
    #  Each hook is a list of tasks to run on a trigger (such as on start, on failure,
    #  etc).
    #  Only Say is supported for now.
    # @param max_retries [Float] This is the number of times we should try to gather the information from the
    #  user before we failover to the fail path. An example of this would be a user
    #  refusing to give their phone number for privacy reasons, and then going down a
    #  different path on account of this
    # @param literal_template [String] This is a liquid templating string. On the first call to Gather, the template
    #  will be filled out with variables from the context, and will be spoken verbatim
    #  to the user. An example would be "Base on your zipcode, it looks like you could
    #  be in one of these counties: {{ counties | join: ", " }}. Which one do you live
    #  in?"
    # @param name [String]
    # @param metadata [Hash{String => Object}] This is for metadata you want to store on the task.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::Gather]
    def initialize(output:, name:, confirm_content: OMIT, hooks: OMIT, max_retries: OMIT, literal_template: OMIT,
                   metadata: OMIT, additional_properties: nil)
      @output = output
      @confirm_content = confirm_content if confirm_content != OMIT
      @hooks = hooks if hooks != OMIT
      @max_retries = max_retries if max_retries != OMIT
      @literal_template = literal_template if literal_template != OMIT
      @name = name
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "output": output,
        "confirmContent": confirm_content,
        "hooks": hooks,
        "maxRetries": max_retries,
        "literalTemplate": literal_template,
        "name": name,
        "metadata": metadata
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of Gather
    #
    # @param json_object [String]
    # @return [Vapi::Gather]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = Vapi::JsonSchema.from_json(json_object: output)
      end
      confirm_content = parsed_json["confirmContent"]
      hooks = parsed_json["hooks"]&.map do |item|
        item = item.to_json
        Vapi::Hook.from_json(json_object: item)
      end
      max_retries = parsed_json["maxRetries"]
      literal_template = parsed_json["literalTemplate"]
      name = parsed_json["name"]
      metadata = parsed_json["metadata"]
      new(
        output: output,
        confirm_content: confirm_content,
        hooks: hooks,
        max_retries: max_retries,
        literal_template: literal_template,
        name: name,
        metadata: metadata,
        additional_properties: struct
      )
    end

    # Serialize an instance of Gather to a JSON object
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
      Vapi::JsonSchema.validate_raw(obj: obj.output)
      obj.confirm_content&.is_a?(Boolean) != false || raise("Passed value for field obj.confirm_content is not the expected type, validation failed.")
      obj.hooks&.is_a?(Array) != false || raise("Passed value for field obj.hooks is not the expected type, validation failed.")
      obj.max_retries&.is_a?(Float) != false || raise("Passed value for field obj.max_retries is not the expected type, validation failed.")
      obj.literal_template&.is_a?(String) != false || raise("Passed value for field obj.literal_template is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
