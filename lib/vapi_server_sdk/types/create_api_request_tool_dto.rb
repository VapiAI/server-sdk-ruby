# frozen_string_literal: true

require_relative "create_api_request_tool_dto_messages_item"
require_relative "create_api_request_tool_dto_method"
require_relative "json_schema"
require_relative "backoff_plan"
require_relative "variable_extraction_plan"
require_relative "tool_rejection_plan"
require "ostruct"
require "json"

module Vapi
  class CreateApiRequestToolDto
    # @return [Array<Vapi::CreateApiRequestToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    attr_reader :messages
    # @return [Vapi::CreateApiRequestToolDtoMethod]
    attr_reader :method_
    # @return [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
    #  @default 20
    attr_reader :timeout_seconds
    # @return [String] The credential ID for API request authentication
    attr_reader :credential_id
    # @return [String] This is the name of the tool. This will be passed to the model.
    #  Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length
    #  of 40.
    attr_reader :name
    # @return [String] This is the description of the tool. This will be passed to the model.
    attr_reader :description
    # @return [String] This is where the request will be sent.
    attr_reader :url
    # @return [Vapi::JsonSchema] This is the body of the request.
    attr_reader :body
    # @return [Vapi::JsonSchema] These are the headers to send with the request.
    attr_reader :headers
    # @return [Vapi::BackoffPlan] This is the backoff plan if the request fails. Defaults to undefined (the
    #  request will not be retried).
    #  @default undefined (the request will not be retried)
    attr_reader :backoff_plan
    # @return [Vapi::VariableExtractionPlan] This is the plan to extract variables from the tool's response. These will be
    #  accessible during the call and stored in `call.artifact.variableValues` after
    #  the call.
    #  Usage:
    #  1. Use `aliases` to extract variables from the tool's response body. (Most
    #  common case)
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "customerName",
    #  "value": "{{customer.name}}"
    #  },
    #  {
    #  "key": "customerAge",
    #  "value": "{{customer.age}}"
    #  }
    #  ]
    #  }
    #  ```
    #  The tool response body is made available to the liquid template.
    #  2. Use `aliases` to extract variables from the tool's response body if the
    #  response is an array.
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "customerName",
    #  "value": "{{$[0].name}}"
    #  },
    #  {
    #  "key": "customerAge",
    #  "value": "{{$[0].age}}"
    #  }
    #  ]
    #  }
    #  ```
    #  $ is a shorthand for the tool's response body. `$[0]` is the first item in the
    #  array. `$[n]` is the nth item in the array. Note, $ is available regardless of
    #  the response body type (both object and array).
    #  3. Use `aliases` to extract variables from the tool's response headers.
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "customerName",
    #  "value": "{{tool.response.headers.customer-name}}"
    #  },
    #  {
    #  "key": "customerAge",
    #  "value": "{{tool.response.headers.customer-age}}"
    #  }
    #  ]
    #  }
    #  ```
    #  `tool.response` is made available to the liquid template. Particularly, both
    #  `tool.response.headers` and `tool.response.body` are available. Note,
    #  `tool.response` is available regardless of the response body type (both object
    #  and array).
    #  4. Use `schema` to extract a large portion of the tool's response body.
    #  4.1. If you hit example.com and it returns `{"name": "John", "age": 30}`, then
    #  you can specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "string"
    #  },
    #  "age": {
    #  "type": "number"
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  These will be extracted as `{{ name }}` and `{{ age }}` respectively. To
    #  emphasize, object properties are extracted as direct global variables.
    #  4.2. If you hit example.com and it returns `{"name": {"first": "John", "last":
    #  "Doe"}}`, then you can specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "object",
    #  "properties": {
    #  "first": {
    #  "type": "string"
    #  },
    #  "last": {
    #  "type": "string"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  These will be extracted as `{{ name }}`. And, `{{ name.first }}` and `{{
    #  name.last }}` will be accessible.
    #  4.3. If you hit example.com and it returns `["94123", "94124"]`, then you can
    #  specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "array",
    #  "title": "zipCodes",
    #  "items": {
    #  "type": "string"
    #  }
    #  }
    #  }
    #  ```
    #  This will be extracted as `{{ zipCodes }}`. To access the array items, you can
    #  use `{{ zipCodes[0] }}` and `{{ zipCodes[1] }}`.
    #  4.4. If you hit example.com and it returns `[{"name": "John", "age": 30,
    #  "zipCodes": ["94123", "94124"]}, {"name": "Jane", "age": 25, "zipCodes":
    #  ["94125", "94126"]}]`, then you can specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "array",
    #  "title": "people",
    #  "items": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "string"
    #  },
    #  "age": {
    #  "type": "number"
    #  },
    #  "zipCodes": {
    #  "type": "array",
    #  "items": {
    #  "type": "string"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  This will be extracted as `{{ people }}`. To access the array items, you can use
    #  `{{ people[n].name }}`, `{{ people[n].age }}`, `{{ people[n].zipCodes }}`, `{{
    #  people[n].zipCodes[0] }}` and `{{ people[n].zipCodes[1] }}`.
    #  Note: Both `aliases` and `schema` can be used together.
    attr_reader :variable_extraction_plan
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

    # @param messages [Array<Vapi::CreateApiRequestToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
    #  For some tools, this is auto-filled based on special fields like
    #  `tool.destinations`. For others like the function tool, these can be custom
    #  configured.
    # @param method_ [Vapi::CreateApiRequestToolDtoMethod]
    # @param timeout_seconds [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
    #  @default 20
    # @param credential_id [String] The credential ID for API request authentication
    # @param name [String] This is the name of the tool. This will be passed to the model.
    #  Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length
    #  of 40.
    # @param description [String] This is the description of the tool. This will be passed to the model.
    # @param url [String] This is where the request will be sent.
    # @param body [Vapi::JsonSchema] This is the body of the request.
    # @param headers [Vapi::JsonSchema] These are the headers to send with the request.
    # @param backoff_plan [Vapi::BackoffPlan] This is the backoff plan if the request fails. Defaults to undefined (the
    #  request will not be retried).
    #  @default undefined (the request will not be retried)
    # @param variable_extraction_plan [Vapi::VariableExtractionPlan] This is the plan to extract variables from the tool's response. These will be
    #  accessible during the call and stored in `call.artifact.variableValues` after
    #  the call.
    #  Usage:
    #  1. Use `aliases` to extract variables from the tool's response body. (Most
    #  common case)
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "customerName",
    #  "value": "{{customer.name}}"
    #  },
    #  {
    #  "key": "customerAge",
    #  "value": "{{customer.age}}"
    #  }
    #  ]
    #  }
    #  ```
    #  The tool response body is made available to the liquid template.
    #  2. Use `aliases` to extract variables from the tool's response body if the
    #  response is an array.
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "customerName",
    #  "value": "{{$[0].name}}"
    #  },
    #  {
    #  "key": "customerAge",
    #  "value": "{{$[0].age}}"
    #  }
    #  ]
    #  }
    #  ```
    #  $ is a shorthand for the tool's response body. `$[0]` is the first item in the
    #  array. `$[n]` is the nth item in the array. Note, $ is available regardless of
    #  the response body type (both object and array).
    #  3. Use `aliases` to extract variables from the tool's response headers.
    #  ```json
    #  {
    #  "aliases": [
    #  {
    #  "key": "customerName",
    #  "value": "{{tool.response.headers.customer-name}}"
    #  },
    #  {
    #  "key": "customerAge",
    #  "value": "{{tool.response.headers.customer-age}}"
    #  }
    #  ]
    #  }
    #  ```
    #  `tool.response` is made available to the liquid template. Particularly, both
    #  `tool.response.headers` and `tool.response.body` are available. Note,
    #  `tool.response` is available regardless of the response body type (both object
    #  and array).
    #  4. Use `schema` to extract a large portion of the tool's response body.
    #  4.1. If you hit example.com and it returns `{"name": "John", "age": 30}`, then
    #  you can specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "string"
    #  },
    #  "age": {
    #  "type": "number"
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  These will be extracted as `{{ name }}` and `{{ age }}` respectively. To
    #  emphasize, object properties are extracted as direct global variables.
    #  4.2. If you hit example.com and it returns `{"name": {"first": "John", "last":
    #  "Doe"}}`, then you can specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "object",
    #  "properties": {
    #  "first": {
    #  "type": "string"
    #  },
    #  "last": {
    #  "type": "string"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  These will be extracted as `{{ name }}`. And, `{{ name.first }}` and `{{
    #  name.last }}` will be accessible.
    #  4.3. If you hit example.com and it returns `["94123", "94124"]`, then you can
    #  specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "array",
    #  "title": "zipCodes",
    #  "items": {
    #  "type": "string"
    #  }
    #  }
    #  }
    #  ```
    #  This will be extracted as `{{ zipCodes }}`. To access the array items, you can
    #  use `{{ zipCodes[0] }}` and `{{ zipCodes[1] }}`.
    #  4.4. If you hit example.com and it returns `[{"name": "John", "age": 30,
    #  "zipCodes": ["94123", "94124"]}, {"name": "Jane", "age": 25, "zipCodes":
    #  ["94125", "94126"]}]`, then you can specify the schema as:
    #  ```json
    #  {
    #  "schema": {
    #  "type": "array",
    #  "title": "people",
    #  "items": {
    #  "type": "object",
    #  "properties": {
    #  "name": {
    #  "type": "string"
    #  },
    #  "age": {
    #  "type": "number"
    #  },
    #  "zipCodes": {
    #  "type": "array",
    #  "items": {
    #  "type": "string"
    #  }
    #  }
    #  }
    #  }
    #  }
    #  }
    #  ```
    #  This will be extracted as `{{ people }}`. To access the array items, you can use
    #  `{{ people[n].name }}`, `{{ people[n].age }}`, `{{ people[n].zipCodes }}`, `{{
    #  people[n].zipCodes[0] }}` and `{{ people[n].zipCodes[1] }}`.
    #  Note: Both `aliases` and `schema` can be used together.
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
    # @return [Vapi::CreateApiRequestToolDto]
    def initialize(method_:, url:, messages: OMIT, timeout_seconds: OMIT, credential_id: OMIT, name: OMIT,
                   description: OMIT, body: OMIT, headers: OMIT, backoff_plan: OMIT, variable_extraction_plan: OMIT, rejection_plan: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @method_ = method_
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @credential_id = credential_id if credential_id != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @url = url
      @body = body if body != OMIT
      @headers = headers if headers != OMIT
      @backoff_plan = backoff_plan if backoff_plan != OMIT
      @variable_extraction_plan = variable_extraction_plan if variable_extraction_plan != OMIT
      @rejection_plan = rejection_plan if rejection_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = {
        "messages": messages,
        "method": method_,
        "timeoutSeconds": timeout_seconds,
        "credentialId": credential_id,
        "name": name,
        "description": description,
        "url": url,
        "body": body,
        "headers": headers,
        "backoffPlan": backoff_plan,
        "variableExtractionPlan": variable_extraction_plan,
        "rejectionPlan": rejection_plan
      }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of CreateApiRequestToolDto
    #
    # @param json_object [String]
    # @return [Vapi::CreateApiRequestToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do |item|
        item = item.to_json
        Vapi::CreateApiRequestToolDtoMessagesItem.from_json(json_object: item)
      end
      method_ = parsed_json["method"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      credential_id = parsed_json["credentialId"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      url = parsed_json["url"]
      if parsed_json["body"].nil?
        body = nil
      else
        body = parsed_json["body"].to_json
        body = Vapi::JsonSchema.from_json(json_object: body)
      end
      if parsed_json["headers"].nil?
        headers = nil
      else
        headers = parsed_json["headers"].to_json
        headers = Vapi::JsonSchema.from_json(json_object: headers)
      end
      if parsed_json["backoffPlan"].nil?
        backoff_plan = nil
      else
        backoff_plan = parsed_json["backoffPlan"].to_json
        backoff_plan = Vapi::BackoffPlan.from_json(json_object: backoff_plan)
      end
      if parsed_json["variableExtractionPlan"].nil?
        variable_extraction_plan = nil
      else
        variable_extraction_plan = parsed_json["variableExtractionPlan"].to_json
        variable_extraction_plan = Vapi::VariableExtractionPlan.from_json(json_object: variable_extraction_plan)
      end
      if parsed_json["rejectionPlan"].nil?
        rejection_plan = nil
      else
        rejection_plan = parsed_json["rejectionPlan"].to_json
        rejection_plan = Vapi::ToolRejectionPlan.from_json(json_object: rejection_plan)
      end
      new(
        messages: messages,
        method_: method_,
        timeout_seconds: timeout_seconds,
        credential_id: credential_id,
        name: name,
        description: description,
        url: url,
        body: body,
        headers: headers,
        backoff_plan: backoff_plan,
        variable_extraction_plan: variable_extraction_plan,
        rejection_plan: rejection_plan,
        additional_properties: struct
      )
    end

    # Serialize an instance of CreateApiRequestToolDto to a JSON object
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
      obj.method_.is_a?(Vapi::CreateApiRequestToolDtoMethod) != false || raise("Passed value for field obj.method_ is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.credential_id&.is_a?(String) != false || raise("Passed value for field obj.credential_id is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.url.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.body.nil? || Vapi::JsonSchema.validate_raw(obj: obj.body)
      obj.headers.nil? || Vapi::JsonSchema.validate_raw(obj: obj.headers)
      obj.backoff_plan.nil? || Vapi::BackoffPlan.validate_raw(obj: obj.backoff_plan)
      obj.variable_extraction_plan.nil? || Vapi::VariableExtractionPlan.validate_raw(obj: obj.variable_extraction_plan)
      obj.rejection_plan.nil? || Vapi::ToolRejectionPlan.validate_raw(obj: obj.rejection_plan)
    end
  end
end
