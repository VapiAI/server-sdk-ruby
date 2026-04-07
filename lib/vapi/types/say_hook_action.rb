# frozen_string_literal: true

module Vapi
  module Types
    class SayHookAction < Internal::Types::Model
      field :prompt, -> { Vapi::Types::SayHookActionPrompt }, optional: true, nullable: false
      field :exact, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
