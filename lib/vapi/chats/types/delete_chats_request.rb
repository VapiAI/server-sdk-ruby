# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      class DeleteChatsRequest < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
