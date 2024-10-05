# frozen_string_literal: true

require "json"
require_relative "../../types/deepgram_transcriber"
require_relative "../../types/gladia_transcriber"
require_relative "../../types/talkscriber_transcriber"

module Vapi
  class Assistants
    # These are the options for the assistant's transcriber.
    class UpdateAssistantDtoTranscriber
      # Deserialize a JSON object to an instance of UpdateAssistantDtoTranscriber
      #
      # @param json_object [String]
      # @return [Vapi::Assistants::UpdateAssistantDtoTranscriber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::DeepgramTranscriber.validate_raw(obj: struct)
          return Vapi::DeepgramTranscriber.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::GladiaTranscriber.validate_raw(obj: struct)
          return Vapi::GladiaTranscriber.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::TalkscriberTranscriber.validate_raw(obj: struct)
          return Vapi::TalkscriberTranscriber.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return Vapi::DeepgramTranscriber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::GladiaTranscriber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::TalkscriberTranscriber.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
