# frozen_string_literal: true
require_relative "create_transfer_call_tool_dto_messages_item"
require_relative "create_transfer_call_tool_dto_destinations_item"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class CreateTransferCallToolDto
  # @return [Array<Vapi::CreateTransferCallToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    attr_reader :messages
  # @return [Array<Vapi::CreateTransferCallToolDtoDestinationsItem>] These are the destinations that the call can be transferred to. If no
#  destinations are provided, server.url will be used to get the transfer
#  destination once the tool is called.
    attr_reader :destinations
  # @return [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    attr_reader :function
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::CreateTransferCallToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    # @param destinations [Array<Vapi::CreateTransferCallToolDtoDestinationsItem>] These are the destinations that the call can be transferred to. If no
#  destinations are provided, server.url will be used to get the transfer
#  destination once the tool is called.
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::CreateTransferCallToolDto]
    def initialize(messages: OMIT, destinations: OMIT, function: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @destinations = destinations if destinations != OMIT
      @function = function if function != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "destinations": destinations, "function": function }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateTransferCallToolDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateTransferCallToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::CreateTransferCallToolDtoMessagesItem.from_json(json_object: item)
end
      destinations = parsed_json["destinations"]&.map do | item |
  item = item.to_json
  Vapi::CreateTransferCallToolDtoDestinationsItem.from_json(json_object: item)
end
      unless parsed_json["function"].nil?
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      else
        function = nil
      end
      new(
        messages: messages,
        destinations: destinations,
        function: function,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateTransferCallToolDto to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.destinations&.is_a?(Array) != false || raise("Passed value for field obj.destinations is not the expected type, validation failed.")
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
    end
  end
end