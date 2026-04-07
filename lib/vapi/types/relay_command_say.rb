# frozen_string_literal: true

module Vapi
  module Types
    class RelayCommandSay < Internal::Types::Model
      field :content, -> { String }, optional: false, nullable: false
    end
  end
end
