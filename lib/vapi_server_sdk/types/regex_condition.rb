# frozen_string_literal: true

require_relative "message_target"
require "ostruct"
require "json"

module Vapi
  class RegexCondition
    # @return [String] This is the regular expression pattern to match against message content.
    #  Note:
    #  - This works by using the RegExp.test method in Node.JS. Eg. /hello/.test("hello
    #  there") will return true.
    #  Hot tips:
    #  - In JavaScript, escape \ when sending the regex pattern. Eg. "hello\sthere"
    #  will be sent over the wire as "hellosthere". Send "hello\\sthere" instead.
    #  - RegExp.test does substring matching, so /cat/.test("I love cats") will return
    #  true. To do full string matching, use anchors: /^cat$/ will only match exactly
    #  "cat".
    #  - Word boundaries \b are useful for matching whole words: /\bcat\b/ matches
    #  "cat" but not "cats" or "category".
    #  - Use inline flags for portability: (?i) for case insensitive, (?m) for
    #  multiline
    attr_reader :regex
    # @return [Vapi::MessageTarget] This is the target for messages to check against.
    #  If not specified, the condition will run on the last message (position: -1).
    #  If role is not specified, it will look at the last message regardless of role.
    #  @default { position: -1 }
    attr_reader :target
    # @return [Boolean] This is the flag that when true, the condition matches if the pattern does NOT
    #  match.
    #  Useful for ensuring certain words/phrases are absent.
    #  @default false
    attr_reader :negate
    # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
    # @return [Object]
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param regex [String] This is the regular expression pattern to match against message content.
    #  Note:
    #  - This works by using the RegExp.test method in Node.JS. Eg. /hello/.test("hello
    #  there") will return true.
    #  Hot tips:
    #  - In JavaScript, escape \ when sending the regex pattern. Eg. "hello\sthere"
    #  will be sent over the wire as "hellosthere". Send "hello\\sthere" instead.
    #  - RegExp.test does substring matching, so /cat/.test("I love cats") will return
    #  true. To do full string matching, use anchors: /^cat$/ will only match exactly
    #  "cat".
    #  - Word boundaries \b are useful for matching whole words: /\bcat\b/ matches
    #  "cat" but not "cats" or "category".
    #  - Use inline flags for portability: (?i) for case insensitive, (?m) for
    #  multiline
    # @param target [Vapi::MessageTarget] This is the target for messages to check against.
    #  If not specified, the condition will run on the last message (position: -1).
    #  If role is not specified, it will look at the last message regardless of role.
    #  @default { position: -1 }
    # @param negate [Boolean] This is the flag that when true, the condition matches if the pattern does NOT
    #  match.
    #  Useful for ensuring certain words/phrases are absent.
    #  @default false
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vapi::RegexCondition]
    def initialize(regex:, target: OMIT, negate: OMIT, additional_properties: nil)
      @regex = regex
      @target = target if target != OMIT
      @negate = negate if negate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "regex": regex, "target": target, "negate": negate }.reject do |_k, v|
        v == OMIT
      end
    end

    # Deserialize a JSON object to an instance of RegexCondition
    #
    # @param json_object [String]
    # @return [Vapi::RegexCondition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      regex = parsed_json["regex"]
      if parsed_json["target"].nil?
        target = nil
      else
        target = parsed_json["target"].to_json
        target = Vapi::MessageTarget.from_json(json_object: target)
      end
      negate = parsed_json["negate"]
      new(
        regex: regex,
        target: target,
        negate: negate,
        additional_properties: struct
      )
    end

    # Serialize an instance of RegexCondition to a JSON object
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
      obj.regex.is_a?(String) != false || raise("Passed value for field obj.regex is not the expected type, validation failed.")
      obj.target.nil? || Vapi::MessageTarget.validate_raw(obj: obj.target)
      obj.negate&.is_a?(Boolean) != false || raise("Passed value for field obj.negate is not the expected type, validation failed.")
    end
  end
end
