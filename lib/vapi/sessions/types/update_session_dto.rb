# frozen_string_literal: true

module Vapi
  module Sessions
    module Types
      class UpdateSessionDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :status, -> { Vapi::Sessions::Types::UpdateSessionDtoStatus }, optional: true, nullable: false
        field :expiration_seconds, -> { Integer }, optional: true, nullable: false, api_name: "expirationSeconds"
        field :messages, -> { Internal::Types::Array[Vapi::Sessions::Types::UpdateSessionDtoMessagesItem] }, optional: true, nullable: false
      end
    end
  end
end
