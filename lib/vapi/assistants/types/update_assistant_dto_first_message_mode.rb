# frozen_string_literal: true

module Vapi
  module Assistants
    module Types
      module UpdateAssistantDtoFirstMessageMode
        extend Vapi::Internal::Types::Enum

        ASSISTANT_SPEAKS_FIRST = "assistant-speaks-first"
        ASSISTANT_SPEAKS_FIRST_WITH_MODEL_GENERATED_MESSAGE = "assistant-speaks-first-with-model-generated-message"
        ASSISTANT_WAITS_FOR_USER = "assistant-waits-for-user"
      end
    end
  end
end
