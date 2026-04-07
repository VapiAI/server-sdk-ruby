# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      class GetChatsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
