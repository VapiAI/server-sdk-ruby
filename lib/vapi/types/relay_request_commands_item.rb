# frozen_string_literal: true

module Vapi
  module Types
    class RelayRequestCommandsItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      discriminant :type

      member -> { Vapi::Types::RelayCommandSay }, key: "SAY"
      member -> { Vapi::Types::RelayCommandNote }, key: "MESSAGE_ADD"
    end
  end
end
