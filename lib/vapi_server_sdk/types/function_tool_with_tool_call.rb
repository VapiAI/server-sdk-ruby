# frozen_string_literal: true

require_relative "function_tool_with_tool_call_messages_item"
require_relative "server"
require_relative "tool_call"
require_relative "open_ai_function"
require_relative "tool_rejection_plan"
require "ostruct"
require "json"

module Vapi
  class FunctionToolWithToolCall
    # @return [Array<Vapi::FunctionToolWithToolCallMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
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
    # @return [Vapi::ToolCall]
    attr_reader :tool_call
    # @return [Vapi::OpenAiFunction] This is the function definition of the tool.
    attr_reader :function
    # @return [Vapi::ToolRejectionPlan] This is the plan to reject a tool call based on the conversation state.
    #  // Example 1: Reject endCall if user didn't say goodbye
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'regex',
    #  regex: '(?i)\\b(bye|goodbye|farewell|see you later|take care)\\b',
    #  target: { position: -1, role: 'user' },
    #  negate: true  // Reject if pattern does NOT match
    #  }]
    #  }
    #  ```
    #  // Example 2: Reject transfer if user is actually asking a question
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'regex',
    #  regex: '\\?',
    #  target: { position: -1, role: 'user' }
    #  }]
    #  }
    #  ```
    #  // Example 3: Reject transfer if user didn't mention transfer recently
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'liquid',
    #  liquid: `{% assign recentMessages = messages | last: 5 %}
    #  {% assign userMessages = recentMessages | where: 'role', 'user' %}
    #  {% assign mentioned = false %}
    #  {% for msg in userMessages %}
    #  {% if msg.content contains 'transfer' or msg.content contains 'connect' or
    #  msg.content contains 'speak to' %}
    #  {% assign mentioned = true %}
    #  {% break %}
    #  {% endif %}
    #  {% endfor %}
    #  {% if mentioned %}
    #  false
    #  {% else %}
    #  true
    #  {% endif %}`
    #  }]
    #  }
    #  ```
    #  // Example 4: Reject endCall if the bot is looping and trying to exit
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'liquid',
    #  liquid: `{% assign recentMessages = messages | last: 6 %}
    #  {% assign userMessages = recentMessages | where: 'role', 'user' | reverse %}
    #  {% if userMessages.size < 3 %}
    #  false
    #  {% else %}
    #  {% assign msg1 = userMessages[0].content | downcase %}
    #  {% assign msg2 = userMessages[1].content | downcase %}
    #  {% assign msg3 = userMessages[2].content | downcase %}
    #  {% comment %} Check for repetitive messages {% endcomment %}
    #  {% if msg1 == msg2 or msg1 == msg3 or msg2 == msg3 %}
    #  true
    #  {% comment %} Check for common loop phrases {% endcomment %}
    #  {% elsif msg1 contains 'cool thanks' or msg2 contains 'cool thanks' or msg3
    #  contains 'cool thanks' %}
    #  true
    #  {% elsif msg1 contains 'okay thanks' or msg2 contains 'okay thanks' or msg3
    #  contains 'okay thanks' %}
    #  true
    #  {% elsif msg1 contains 'got it' or msg2 contains 'got it' or msg3 contains
    #  'got it' %}
    #  true
    #  {% else %}
    #  false
    #  {% endif %}
    #  {% endif %}`
    #  }]
    #  }
    #  ```
    attr_reader :rejection_plan
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::FunctionToolWithToolCallMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
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
    # @param tool_call [Vapi::ToolCall]
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
    # @param rejection_plan [Vapi::ToolRejectionPlan] This is the plan to reject a tool call based on the conversation state.
    #  // Example 1: Reject endCall if user didn't say goodbye
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'regex',
    #  regex: '(?i)\\b(bye|goodbye|farewell|see you later|take care)\\b',
    #  target: { position: -1, role: 'user' },
    #  negate: true  // Reject if pattern does NOT match
    #  }]
    #  }
    #  ```
    #  // Example 2: Reject transfer if user is actually asking a question
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'regex',
    #  regex: '\\?',
    #  target: { position: -1, role: 'user' }
    #  }]
    #  }
    #  ```
    #  // Example 3: Reject transfer if user didn't mention transfer recently
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'liquid',
    #  liquid: `{% assign recentMessages = messages | last: 5 %}
    #  {% assign userMessages = recentMessages | where: 'role', 'user' %}
    #  {% assign mentioned = false %}
    #  {% for msg in userMessages %}
    #  {% if msg.content contains 'transfer' or msg.content contains 'connect' or
    #  msg.content contains 'speak to' %}
    #  {% assign mentioned = true %}
    #  {% break %}
    #  {% endif %}
    #  {% endfor %}
    #  {% if mentioned %}
    #  false
    #  {% else %}
    #  true
    #  {% endif %}`
    #  }]
    #  }
    #  ```
    #  // Example 4: Reject endCall if the bot is looping and trying to exit
    #  ```json
    #  {
    #  conditions: [{
    #  type: 'liquid',
    #  liquid: `{% assign recentMessages = messages | last: 6 %}
    #  {% assign userMessages = recentMessages | where: 'role', 'user' | reverse %}
    #  {% if userMessages.size < 3 %}
    #  false
    #  {% else %}
    #  {% assign msg1 = userMessages[0].content | downcase %}
    #  {% assign msg2 = userMessages[1].content | downcase %}
    #  {% assign msg3 = userMessages[2].content | downcase %}
    #  {% comment %} Check for repetitive messages {% endcomment %}
    #  {% if msg1 == msg2 or msg1 == msg3 or msg2 == msg3 %}
    #  true
    #  {% comment %} Check for common loop phrases {% endcomment %}
    #  {% elsif msg1 contains 'cool thanks' or msg2 contains 'cool thanks' or msg3
    #  contains 'cool thanks' %}
    #  true
    #  {% elsif msg1 contains 'okay thanks' or msg2 contains 'okay thanks' or msg3
    #  contains 'okay thanks' %}
    #  true
    #  {% elsif msg1 contains 'got it' or msg2 contains 'got it' or msg3 contains
    #  'got it' %}
    #  true
    #  {% else %}
    #  false
    #  {% endif %}
    #  {% endif %}`
    #  }]
    #  }
    #  ```
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::FunctionToolWithToolCall]
    def initialize(tool_call:, messages: OMIT, async: OMIT, server: OMIT, function: OMIT, rejection_plan: OMIT,
                   additional_properties: nil)
      @messages = messages if messages != OMIT
      @async = async if async != OMIT
      @server = server if server != OMIT
      @tool_call = tool_call
      @function = function if function != OMIT
      @rejection_plan = rejection_plan if rejection_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "async": async,
        "server": server,
        "toolCall": tool_call,
        "function": function,
        "rejectionPlan": rejection_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of FunctionToolWithToolCall
    #
    # @param json_object [String]
    # @return [Vapi::FunctionToolWithToolCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::FunctionToolWithToolCallMessagesItem.from_json(json_object: item)
      end
      async = parsed_json["async"]
      if parsed_json["server"].nil?
        server = nil
      else
        server = parsed_json["server"].to_json
        server = Vapi::Server.from_json(json_object: server)
      end
      if parsed_json["toolCall"].nil?
        tool_call = nil
      else
        tool_call = parsed_json["toolCall"].to_json
        tool_call = Vapi::ToolCall.from_json(json_object: tool_call)
      end
      if parsed_json["function"].nil?
        function = nil
      else
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      end
      if parsed_json["rejectionPlan"].nil?
        rejection_plan = nil
      else
        rejection_plan = parsed_json["rejectionPlan"].to_json
        rejection_plan = Vapi::ToolRejectionPlan.from_json(json_object: rejection_plan)
      end
      new(
        messages: messages,
        async: async,
        server: server,
        tool_call: tool_call,
        function: function,
        rejection_plan: rejection_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of FunctionToolWithToolCall to a JSON object
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
      obj.messages&.is_a?(Array) != false || raise("Passed value for field obj.messages is not the expected type, validation failed.")
      obj.async&.is_a?(Boolean) != false || raise("Passed value for field obj.async is not the expected type, validation failed.")
      obj.server.nil? || Vapi::Server.validate_raw(obj: obj.server)
      Vapi::ToolCall.validate_raw(obj: obj.tool_call)
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
      obj.rejection_plan.nil? || Vapi::ToolRejectionPlan.validate_raw(obj: obj.rejection_plan)
    end
  end
end
