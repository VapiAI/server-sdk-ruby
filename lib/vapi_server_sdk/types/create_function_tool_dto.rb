# frozen_string_literal: true
require_relative "create_function_tool_dto_messages_item"
require_relative "server"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class CreateFunctionToolDto
  # @return [Array<Vapi::CreateFunctionToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    attr_reader :messages
  # @return [Boolean] This determines if the tool is async.
#  If async, the assistant will move forward without waiting for your server to
#  respond. This is useful if you just want to trigger something on your server.
#  If sync, the assistant will wait for your server to respond. This is useful if
#  want assistant to respond with the result from your server.
#  Defaults to synchronous (`false`).
    attr_reader :async
  # @return [Vapi::Server] 
#  This is the server where a `tool-calls` webhook will be sent.
#  Notes:
#  - Webhook is sent to this server when a tool call is made.
#  - Webhook contains the call, assistant, and phone number objects.
#  - Webhook contains the variables set on the assistant.
#  - Webhook is sent to the first available URL in this order:
#  {{tool.server.url}}, {{assistant.server.url}}, {{phoneNumber.server.url}},
#  {{org.server.url}}.
#  - Webhook expects a response with tool call result.
    attr_reader :server
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

    # @param messages [Array<Vapi::CreateFunctionToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    # @param async [Boolean] This determines if the tool is async.
#  If async, the assistant will move forward without waiting for your server to
#  respond. This is useful if you just want to trigger something on your server.
#  If sync, the assistant will wait for your server to respond. This is useful if
#  want assistant to respond with the result from your server.
#  Defaults to synchronous (`false`).
    # @param server [Vapi::Server] 
#  This is the server where a `tool-calls` webhook will be sent.
#  Notes:
#  - Webhook is sent to this server when a tool call is made.
#  - Webhook contains the call, assistant, and phone number objects.
#  - Webhook contains the variables set on the assistant.
#  - Webhook is sent to the first available URL in this order:
#  {{tool.server.url}}, {{assistant.server.url}}, {{phoneNumber.server.url}},
#  {{org.server.url}}.
#  - Webhook expects a response with tool call result.
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
    # @return [Vapi::CreateFunctionToolDto]
    def initialize(messages: OMIT, async: OMIT, server: OMIT, function: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @async = async if async != OMIT
      @server = server if server != OMIT
      @function = function if function != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "async": async, "server": server, "function": function }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateFunctionToolDto
    #
    # @param json_object [String] 
    # @return [Vapi::CreateFunctionToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::CreateFunctionToolDtoMessagesItem.from_json(json_object: item)
end
      async = parsed_json["async"]
      unless parsed_json["server"].nil?
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      else
        server = nil
      end
      unless parsed_json["function"].nil?
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      else
        function = nil
      end
      new(
        messages: messages,
        async: async,
        server: server,
        function: function,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateFunctionToolDto to a JSON object
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
      obj.async&.is_a?(Boolean) != false || raise("Passed value for field obj.async is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
    end
  end
end