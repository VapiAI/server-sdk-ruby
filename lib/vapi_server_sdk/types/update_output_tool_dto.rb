# frozen_string_literal: true

require_relative "update_output_tool_dto_messages_item"
require_relative "open_ai_function"
require_relative "server"
require "ostruct"
require "json"

module Vapi
  class UpdateOutputToolDto
    # @return [Boolean] This determines if the tool is async.
    #  If async, the assistant will move forward without waiting for your server to
    #  respond. This is useful if you just want to trigger something on your server.
    #  If sync, the assistant will wait for your server to respond. This is useful if
    #  want assistant to respond with the result from your server.
    #  Defaults to synchronous (`false`).
    attr_reader :async
    # @return [Array<Vapi::UpdateOutputToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    attr_reader :messages
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
    # @return [Vapi::Server] This is the server that will be hit when this tool is requested by the model.
    #  All requests will be sent with the call object among other things. You can find
    #  more details in the Server URL documentation.
    #  This overrides the serverUrl set on the org and the phoneNumber. Order of
    #  precedence: highest tool.server.url, then assistant.serverUrl, then
    #  phoneNumber.serverUrl, then org.serverUrl.
    attr_reader :server
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param async [Boolean] This determines if the tool is async.
    #  If async, the assistant will move forward without waiting for your server to
    #  respond. This is useful if you just want to trigger something on your server.
    #  If sync, the assistant will wait for your server to respond. This is useful if
    #  want assistant to respond with the result from your server.
    #  Defaults to synchronous (`false`).
    # @param messages [Array<Vapi::UpdateOutputToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
    #  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
    #  tool-specific fields like `tool.destinations`. But, even in those cases, you can
    #  provide a custom function definition for advanced use cases.
    #  An example of an advanced use case is if you want to customize the message
    #  that's spoken for `endCall` tool. You can specify a function where it returns an
    #  argument "reason". Then, in `messages` array, you can have many
    #  "request-complete" messages. One of these messages will be triggered if the
    #  `messages[].conditions` matches the "reason" argument.
    # @param server [Vapi::Server] This is the server that will be hit when this tool is requested by the model.
    #  All requests will be sent with the call object among other things. You can find
    #  more details in the Server URL documentation.
    #  This overrides the serverUrl set on the org and the phoneNumber. Order of
    #  precedence: highest tool.server.url, then assistant.serverUrl, then
    #  phoneNumber.serverUrl, then org.serverUrl.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateOutputToolDto]
    def initialize(async: OMIT, messages: OMIT, function: OMIT, server: OMIT, additional_properties: nil)
      @async = async if async != OMIT
      @messages = messages if messages != OMIT
      @function = function if function != OMIT
      @server = server if server != OMIT
      @additional_properties = additional_properties
      @_field_set = { "async": async, "messages": messages, "function": function, "server": server }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateOutputToolDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateOutputToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      async = parsed_json["async"]
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::UpdateOutputToolDtoMessagesItem.from_json(json_object: item)
      end
      if parsed_json["function"].nil?
        function = nil
      else
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      end
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      new(
        async: async,
        messages: messages,
        function: function,
        server: server,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateOutputToolDto to a JSON object
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
      obj.async&.is_a?(Boolean) != false || raise("Passed value for field obj.async is not the expected type, validation failed.")
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
    end
  end
end
