# frozen_string_literal: true

require_relative "update_handoff_tool_dto_messages_item"
require_relative "update_handoff_tool_dto_destinations_item"
require_relative "tool_rejection_plan"
require_relative "open_ai_function"
require "ostruct"
require "json"

module Vapi
  class UpdateHandoffToolDto
    # @return [Array<Vapi::UpdateHandoffToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    attr_reader :messages
    # @return [Array<Vapi::UpdateHandoffToolDtoDestinationsItem>] These are the destinations that the call can be handed off to.
    #  Usage:
    #  1. Single destination
    #  Use `assistantId` to handoff the call to a saved assistant, or `assistantName`
    #  to handoff the call to an assistant in the same squad.
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123", // or "assistantName": "Assistant123"
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  2. Multiple destinations
    #  2.1. Multiple Tools, Each With One Destination (OpenAI recommended)
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123",
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  },
    #  ],
    #  },
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-456",
    #  "description": "customer wants to be handed off to assistant-456",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  2.2. One Tool, Multiple Destinations (Anthropic recommended)
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123",
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  },
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-456",
    #  "description": "customer wants to be handed off to assistant-456",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  3. Dynamic destination
    #  3.1 To determine the destination dynamically, supply a `dynamic` handoff
    #  destination type and a `server` object.
    #  VAPI will send a handoff-destination-request webhook to the `server.url`.
    #  The response from the server will be used as the destination (if valid).
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "dynamic",
    #  "server": {
    #  "url": "https://example.com"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  3.2. To pass custom parameters to the server, you can use the `function` object.
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "dynamic",
    #  "server": {
    #  "url": "https://example.com"
    #  },
    #  }
    #  ],
    #  "function": {
    #  "name": "handoff",
    #  "description": "Call this function when the customer is ready to be
    #  handed off to the next assistant",
    #  "parameters": {
    #  "type": "object",
    #  "properties": {
    #  "destination": {
    #  "type": "string",
    #  "description": "Use dynamic when customer is ready to be handed
    #  off to the next assistant",
    #  "enum": ["dynamic"]
    #  },
    #  "customerAreaCode": {
    #  "type": "number",
    #  "description": "Area code of the customer"
    #  },
    #  "customerIntent": {
    #  "type": "string",
    #  "enum": ["new-customer", "existing-customer"],
    #  "description": "Use new-customer when customer is a new customer,
    #  existing-customer when customer is an existing customer"
    #  },
    #  "customerSentiment": {
    #  "type": "string",
    #  "enum": ["positive", "negative", "neutral"],
    #  "description": "Use positive when customer is happy, negative when
    #  customer is unhappy, neutral when customer is neutral"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ]
    #  }
    #  ```
    #  The properties `customerAreaCode`, `customerIntent`, and `customerSentiment`
    #  will be passed to the server in the webhook request body.
    attr_reader :destinations
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
    # @return [Vapi::OpenAiFunction] This is the optional function definition that will be passed to the LLM.
    #  If this is not defined, we will construct this based on the other properties.
    #  For example, given the following tools definition:
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123",
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  },
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-456",
    #  "description": "customer wants to be handed off to assistant-456",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  We will construct the following function definition:
    #  ```json
    #  {
    #  "function": {
    #  "name": "handoff_to_assistant-123",
    #  "description": "
    #  Use this function to handoff the call to the next assistant.
    #  Only use it when instructions explicitly ask you to use the
    #  handoff_to_assistant function.
    #  DO NOT call this function unless you are instructed to do so.
    #  Here are the destinations you can handoff the call to:
    #  1. assistant-123. When: customer wants to be handed off to
    #  assistant-123
    #  2. assistant-456. When: customer wants to be handed off to
    #  assistant-456
    #  ",
    #  "parameters": {
    #  "type": "object",
    #  "properties": {
    #  "destination": {
    #  "type": "string",
    #  "description": "Options: assistant-123 (customer wants to be handed
    #  off to assistant-123), assistant-456 (customer wants to be handed off to
    #  assistant-456)",
    #  "enum": ["assistant-123", "assistant-456"]
    #  },
    #  },
    #  "required": ["destination"]
    #  }
    #  }
    #  }
    #  ```
    #  To override this function, please provide an OpenAI function definition and
    #  refer to it in the system prompt.
    #  You may override parts of the function definition (i.e. you may only want to
    #  change the function name for your prompt).
    #  If you choose to override the function parameters, it must include `destination`
    #  as a required parameter, and it must evaluate to either an assistantId,
    #  assistantName, or a the string literal `dynamic`.
    #  To pass custom parameters to the server in a dynamic handoff, you can use the
    #  function parameters, with `dynamic` as the destination.
    #  ```json
    #  {
    #  "function": {
    #  "name": "dynamic_handoff",
    #  "description": "
    #  Call this function when the customer is ready to be handed off to the
    #  next assistant
    #  ",
    #  "parameters": {
    #  "type": "object",
    #  "properties": {
    #  "destination": {
    #  "type": "string",
    #  "enum": ["dynamic"]
    #  },
    #  "customerAreaCode": {
    #  "type": "number",
    #  "description": "Area code of the customer"
    #  },
    #  "customerIntent": {
    #  "type": "string",
    #  "enum": ["new-customer", "existing-customer"],
    #  "description": "Use new-customer when customer is a new customer,
    #  existing-customer when customer is an existing customer"
    #  },
    #  "customerSentiment": {
    #  "type": "string",
    #  "enum": ["positive", "negative", "neutral"],
    #  "description": "Use positive when customer is happy, negative when
    #  customer is unhappy, neutral when customer is neutral"
    #  }
    #  },
    #  "required": ["destination", "customerAreaCode", "customerIntent",
    #  "customerSentiment"]
    #  }
    #  }
    #  }
    #  ```
    attr_reader :function
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::UpdateHandoffToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    # @param destinations [Array<Vapi::UpdateHandoffToolDtoDestinationsItem>] These are the destinations that the call can be handed off to.
    #  Usage:
    #  1. Single destination
    #  Use `assistantId` to handoff the call to a saved assistant, or `assistantName`
    #  to handoff the call to an assistant in the same squad.
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123", // or "assistantName": "Assistant123"
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  2. Multiple destinations
    #  2.1. Multiple Tools, Each With One Destination (OpenAI recommended)
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123",
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  },
    #  ],
    #  },
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-456",
    #  "description": "customer wants to be handed off to assistant-456",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  2.2. One Tool, Multiple Destinations (Anthropic recommended)
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123",
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  },
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-456",
    #  "description": "customer wants to be handed off to assistant-456",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  3. Dynamic destination
    #  3.1 To determine the destination dynamically, supply a `dynamic` handoff
    #  destination type and a `server` object.
    #  VAPI will send a handoff-destination-request webhook to the `server.url`.
    #  The response from the server will be used as the destination (if valid).
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "dynamic",
    #  "server": {
    #  "url": "https://example.com"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  3.2. To pass custom parameters to the server, you can use the `function` object.
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "dynamic",
    #  "server": {
    #  "url": "https://example.com"
    #  },
    #  }
    #  ],
    #  "function": {
    #  "name": "handoff",
    #  "description": "Call this function when the customer is ready to be
    #  handed off to the next assistant",
    #  "parameters": {
    #  "type": "object",
    #  "properties": {
    #  "destination": {
    #  "type": "string",
    #  "description": "Use dynamic when customer is ready to be handed
    #  off to the next assistant",
    #  "enum": ["dynamic"]
    #  },
    #  "customerAreaCode": {
    #  "type": "number",
    #  "description": "Area code of the customer"
    #  },
    #  "customerIntent": {
    #  "type": "string",
    #  "enum": ["new-customer", "existing-customer"],
    #  "description": "Use new-customer when customer is a new customer,
    #  existing-customer when customer is an existing customer"
    #  },
    #  "customerSentiment": {
    #  "type": "string",
    #  "enum": ["positive", "negative", "neutral"],
    #  "description": "Use positive when customer is happy, negative when
    #  customer is unhappy, neutral when customer is neutral"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ]
    #  }
    #  ```
    #  The properties `customerAreaCode`, `customerIntent`, and `customerSentiment`
    #  will be passed to the server in the webhook request body.
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
    # @param function [Vapi::OpenAiFunction] This is the optional function definition that will be passed to the LLM.
    #  If this is not defined, we will construct this based on the other properties.
    #  For example, given the following tools definition:
    #  ```json
    #  {
    #  "tools": [
    #  {
    #  "type": "handoff",
    #  "destinations": [
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-123",
    #  "description": "customer wants to be handed off to assistant-123",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  },
    #  {
    #  "type": "assistant",
    #  "assistantId": "assistant-456",
    #  "description": "customer wants to be handed off to assistant-456",
    #  "contextEngineeringPlan": {
    #  "type": "all"
    #  }
    #  }
    #  ],
    #  }
    #  ]
    #  }
    #  ```
    #  We will construct the following function definition:
    #  ```json
    #  {
    #  "function": {
    #  "name": "handoff_to_assistant-123",
    #  "description": "
    #  Use this function to handoff the call to the next assistant.
    #  Only use it when instructions explicitly ask you to use the
    #  handoff_to_assistant function.
    #  DO NOT call this function unless you are instructed to do so.
    #  Here are the destinations you can handoff the call to:
    #  1. assistant-123. When: customer wants to be handed off to
    #  assistant-123
    #  2. assistant-456. When: customer wants to be handed off to
    #  assistant-456
    #  ",
    #  "parameters": {
    #  "type": "object",
    #  "properties": {
    #  "destination": {
    #  "type": "string",
    #  "description": "Options: assistant-123 (customer wants to be handed
    #  off to assistant-123), assistant-456 (customer wants to be handed off to
    #  assistant-456)",
    #  "enum": ["assistant-123", "assistant-456"]
    #  },
    #  },
    #  "required": ["destination"]
    #  }
    #  }
    #  }
    #  ```
    #  To override this function, please provide an OpenAI function definition and
    #  refer to it in the system prompt.
    #  You may override parts of the function definition (i.e. you may only want to
    #  change the function name for your prompt).
    #  If you choose to override the function parameters, it must include `destination`
    #  as a required parameter, and it must evaluate to either an assistantId,
    #  assistantName, or a the string literal `dynamic`.
    #  To pass custom parameters to the server in a dynamic handoff, you can use the
    #  function parameters, with `dynamic` as the destination.
    #  ```json
    #  {
    #  "function": {
    #  "name": "dynamic_handoff",
    #  "description": "
    #  Call this function when the customer is ready to be handed off to the
    #  next assistant
    #  ",
    #  "parameters": {
    #  "type": "object",
    #  "properties": {
    #  "destination": {
    #  "type": "string",
    #  "enum": ["dynamic"]
    #  },
    #  "customerAreaCode": {
    #  "type": "number",
    #  "description": "Area code of the customer"
    #  },
    #  "customerIntent": {
    #  "type": "string",
    #  "enum": ["new-customer", "existing-customer"],
    #  "description": "Use new-customer when customer is a new customer,
    #  existing-customer when customer is an existing customer"
    #  },
    #  "customerSentiment": {
    #  "type": "string",
    #  "enum": ["positive", "negative", "neutral"],
    #  "description": "Use positive when customer is happy, negative when
    #  customer is unhappy, neutral when customer is neutral"
    #  }
    #  },
    #  "required": ["destination", "customerAreaCode", "customerIntent",
    #  "customerSentiment"]
    #  }
    #  }
    #  }
    #  ```
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateHandoffToolDto]
    def initialize(messages: OMIT, destinations: OMIT, rejection_plan: OMIT, function: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @destinations = destinations if destinations != OMIT
      @rejection_plan = rejection_plan if rejection_plan != OMIT
      @function = function if function != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "destinations": destinations,
        "rejectionPlan": rejection_plan,
        "function": function
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of UpdateHandoffToolDto
    #
    # @param json_object [String]
    # @return [Vapi::UpdateHandoffToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::UpdateHandoffToolDtoMessagesItem.from_json(json_object: item)
      end
      destinations = parsed_json["destinations"]&.map do |item|
        item = item.to_json
        Vapi::UpdateHandoffToolDtoDestinationsItem.from_json(json_object: item)
      end
      if parsed_json["rejectionPlan"].nil?
        rejection_plan = nil
      else
        rejection_plan = parsed_json["rejectionPlan"].to_json
        rejection_plan = Vapi::ToolRejectionPlan.from_json(json_object: rejection_plan)
      end
      if parsed_json["function"].nil?
        function = nil
      else
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      end
      new(
        messages: messages,
        destinations: destinations,
        rejection_plan: rejection_plan,
        function: function,
        additional_properties: struct
      )
    end

    # Serialize an instance of UpdateHandoffToolDto to a JSON object
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
      obj.destinations&.is_a?(Array) != false || raise("Passed value for field obj.destinations is not the expected type, validation failed.")
      obj.rejection_plan.nil? || Vapi::ToolRejectionPlan.validate_raw(obj: obj.rejection_plan)
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
    end
  end
end
