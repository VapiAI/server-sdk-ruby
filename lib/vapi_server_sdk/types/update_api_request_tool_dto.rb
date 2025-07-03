# frozen_string_literal: true
require_relative "update_api_request_tool_dto_messages_item"
require_relative "update_api_request_tool_dto_method"
require_relative "open_ai_function"
require_relative "json_schema"
require_relative "backoff_plan"
require_relative "variable_extraction_plan"
require "ostruct"
require "json"

module Vapi
  class UpdateApiRequestToolDto
  # @return [Array<Vapi::UpdateApiRequestToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    attr_reader :messages
  # @return [Vapi::UpdateApiRequestToolDtoMethod] 
    attr_reader :method
  # @return [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
#  @default 20
    attr_reader :timeout_seconds
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
  # @return [Vapi::JsonSchema] These are the headers to send in the request.
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
#  These will be extracted as `{{ name }}` and `{{ age }}` respectively. To
#  emphasize, object properties are extracted as direct global variables.
#  4.3. If you hit example.com and it returns `{"name": {"first": "John", "last":
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
#  4.4. If you hit example.com and it returns `["94123", "94124"]`, then you can
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
#  4.5. If you hit example.com and it returns `[{"name": "John", "age": 30,
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
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param messages [Array<Vapi::UpdateApiRequestToolDtoMessagesItem>] These are the messages that will be spoken to the user as the tool is running.
#  For some tools, this is auto-filled based on special fields like
#  `tool.destinations`. For others like the function tool, these can be custom
#  configured.
    # @param method [Vapi::UpdateApiRequestToolDtoMethod] 
    # @param timeout_seconds [Float] This is the timeout in seconds for the request. Defaults to 20 seconds.
#  @default 20
    # @param function [Vapi::OpenAiFunction] This is the function definition of the tool.
#  For `endCall`, `transferCall`, and `dtmf` tools, this is auto-filled based on
#  tool-specific fields like `tool.destinations`. But, even in those cases, you can
#  provide a custom function definition for advanced use cases.
#  An example of an advanced use case is if you want to customize the message
#  that's spoken for `endCall` tool. You can specify a function where it returns an
#  argument "reason". Then, in `messages` array, you can have many
#  "request-complete" messages. One of these messages will be triggered if the
#  `messages[].conditions` matches the "reason" argument.
    # @param name [String] This is the name of the tool. This will be passed to the model.
#  Must be a-z, A-Z, 0-9, or contain underscores and dashes, with a maximum length
#  of 40.
    # @param description [String] This is the description of the tool. This will be passed to the model.
    # @param url [String] This is where the request will be sent.
    # @param body [Vapi::JsonSchema] This is the body of the request.
    # @param headers [Vapi::JsonSchema] These are the headers to send in the request.
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
#  These will be extracted as `{{ name }}` and `{{ age }}` respectively. To
#  emphasize, object properties are extracted as direct global variables.
#  4.3. If you hit example.com and it returns `{"name": {"first": "John", "last":
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
#  4.4. If you hit example.com and it returns `["94123", "94124"]`, then you can
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
#  4.5. If you hit example.com and it returns `[{"name": "John", "age": 30,
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
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::UpdateApiRequestToolDto]
    def initialize(messages: OMIT, method: OMIT, timeout_seconds: OMIT, function: OMIT, name: OMIT, description: OMIT, url: OMIT, body: OMIT, headers: OMIT, backoff_plan: OMIT, variable_extraction_plan: OMIT, additional_properties: nil)
      @messages = messages if messages != OMIT
      @method = method if method != OMIT
      @timeout_seconds = timeout_seconds if timeout_seconds != OMIT
      @function = function if function != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @url = url if url != OMIT
      @body = body if body != OMIT
      @headers = headers if headers != OMIT
      @backoff_plan = backoff_plan if backoff_plan != OMIT
      @variable_extraction_plan = variable_extraction_plan if variable_extraction_plan != OMIT
      @additional_properties = additional_properties
      @_field_set = { "messages": messages, "method": method, "timeoutSeconds": timeout_seconds, "function": function, "name": name, "description": description, "url": url, "body": body, "headers": headers, "backoffPlan": backoff_plan, "variableExtractionPlan": variable_extraction_plan }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateApiRequestToolDto
    #
    # @param json_object [String] 
    # @return [Vapi::UpdateApiRequestToolDto]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      messages = parsed_json["messages"]&.map do | item |
  item = item.to_json
  Vapi::UpdateApiRequestToolDtoMessagesItem.from_json(json_object: item)
end
      method = parsed_json["method"]
      timeout_seconds = parsed_json["timeoutSeconds"]
      unless parsed_json["function"].nil?
        function = parsed_json["function"].to_json
        function = Vapi::OpenAiFunction.from_json(json_object: function)
      else
        function = nil
      end
      name = parsed_json["name"]
      description = parsed_json["description"]
      url = parsed_json["url"]
      unless parsed_json["body"].nil?
        body = parsed_json["body"].to_json
        body = Vapi::JsonSchema.from_json(json_object: body)
      else
        body = nil
      end
      unless parsed_json["headers"].nil?
        headers = parsed_json["headers"].to_json
        headers = Vapi::JsonSchema.from_json(json_object: headers)
      else
        headers = nil
      end
      unless parsed_json["backoffPlan"].nil?
        backoff_plan = parsed_json["backoffPlan"].to_json
        backoff_plan = Vapi::BackoffPlan.from_json(json_object: backoff_plan)
      else
        backoff_plan = nil
      end
      unless parsed_json["variableExtractionPlan"].nil?
        variable_extraction_plan = parsed_json["variableExtractionPlan"].to_json
        variable_extraction_plan = Vapi::VariableExtractionPlan.from_json(json_object: variable_extraction_plan)
      else
        variable_extraction_plan = nil
      end
      new(
        messages: messages,
        method: method,
        timeout_seconds: timeout_seconds,
        function: function,
        name: name,
        description: description,
        url: url,
        body: body,
        headers: headers,
        backoff_plan: backoff_plan,
        variable_extraction_plan: variable_extraction_plan,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateApiRequestToolDto to a JSON object
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
      obj.method&.is_a?(Vapi::UpdateApiRequestToolDtoMethod) != false || raise("Passed value for field obj.method is not the expected type, validation failed.")
      obj.timeout_seconds&.is_a?(Float) != false || raise("Passed value for field obj.timeout_seconds is not the expected type, validation failed.")
      obj.function.nil? || Vapi::OpenAiFunction.validate_raw(obj: obj.function)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.body.nil? || Vapi::JsonSchema.validate_raw(obj: obj.body)
      obj.headers.nil? || Vapi::JsonSchema.validate_raw(obj: obj.headers)
      obj.backoff_plan.nil? || Vapi::BackoffPlan.validate_raw(obj: obj.backoff_plan)
      obj.variable_extraction_plan.nil? || Vapi::VariableExtractionPlan.validate_raw(obj: obj.variable_extraction_plan)
    end
  end
end