# frozen_string_literal: true

require "json"
require_relative "../../types/azure_voice"
require_relative "../../types/cartesia_voice"
require_relative "../../types/deepgram_voice"
require_relative "../../types/eleven_labs_voice"
require_relative "../../types/lmnt_voice"
require_relative "../../types/neets_voice"
require_relative "../../types/open_ai_voice"
require_relative "../../types/play_ht_voice"
require_relative "../../types/rime_ai_voice"

module Vapi
  class Assistants
    # These are the options for the assistant's voice.
    class UpdateAssistantDtoVoice
      # Deserialize a JSON object to an instance of UpdateAssistantDtoVoice
      #
      # @param json_object [String]
      # @return [Vapi::Assistants::UpdateAssistantDtoVoice]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          Vapi::AzureVoice.validate_raw(obj: struct)
          return Vapi::AzureVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::CartesiaVoice.validate_raw(obj: struct)
          return Vapi::CartesiaVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::DeepgramVoice.validate_raw(obj: struct)
          return Vapi::DeepgramVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::ElevenLabsVoice.validate_raw(obj: struct)
          return Vapi::ElevenLabsVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::LmntVoice.validate_raw(obj: struct)
          return Vapi::LmntVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::NeetsVoice.validate_raw(obj: struct)
          return Vapi::NeetsVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::OpenAiVoice.validate_raw(obj: struct)
          return Vapi::OpenAiVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::PlayHtVoice.validate_raw(obj: struct)
          return Vapi::PlayHtVoice.from_json(json_object: struct) unless struct.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Vapi::RimeAiVoice.validate_raw(obj: struct)
          return Vapi::RimeAiVoice.from_json(json_object: struct) unless struct.nil?

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
          return Vapi::AzureVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::CartesiaVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::DeepgramVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::ElevenLabsVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::LmntVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::NeetsVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::OpenAiVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::PlayHtVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return Vapi::RimeAiVoice.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
