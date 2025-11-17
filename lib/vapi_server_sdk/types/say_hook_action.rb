# frozen_string_literal: true

require_relative "say_hook_action_prompt"
require "ostruct"
require "json"

module Vapi
  class SayHookAction
    # @return [Vapi::SayHookActionPrompt] This is the prompt for the assistant to generate a response based on existing
    #  conversation.
    #  Can be a string or an array of chat messages.
    attr_reader :prompt
    # @return [Hash{String => Object}] This is the message to say
    attr_reader :exact
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param prompt [Vapi::SayHookActionPrompt] This is the prompt for the assistant to generate a response based on existing
    #  conversation.
    #  Can be a string or an array of chat messages.
    # @param exact [Hash{String => Object}] This is the message to say
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::SayHookAction]
    def initialize(prompt: OMIT, exact: OMIT, additional_properties: nil)
      @prompt = prompt if prompt != OMIT
      @exact = exact if exact != OMIT
      @additional_properties = additional_properties
      @_field_set = { "prompt": prompt, "exact": exact }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of SayHookAction
    #
    # @param json_object [String]
    # @return [Vapi::SayHookAction]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["prompt"].nil?
        prompt = nil
      else
        prompt = parsed_json["prompt"].to_json
        prompt = Vapi::SayHookActionPrompt.from_json(json_object: prompt)
      end
      exact = parsed_json["exact"]
      new(
        prompt: prompt,
        exact: exact,
        additional_properties: struct
      )
    end

    # Serialize an instance of SayHookAction to a JSON object
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
      obj.prompt.nil? || Vapi::SayHookActionPrompt.validate_raw(obj: obj.prompt)
      obj.exact&.is_a?(Hash) != false || raise("Passed value for field obj.exact is not the expected type, validation failed.")
    end
  end
end
