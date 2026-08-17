# frozen_string_literal: true

module Vapi
  module Types
    # A hook action that makes the assistant speak exact text or generate a response from a prompt.
    class SayHookAction < Internal::Types::Model
      field :exact, -> { Vapi::Types::SayHookActionExact }, optional: true, nullable: false
      field :prompt, -> { Vapi::Types::SayHookActionPrompt }, optional: true, nullable: false
    end
  end
end
