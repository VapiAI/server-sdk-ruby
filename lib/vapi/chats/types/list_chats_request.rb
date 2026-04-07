# frozen_string_literal: true

module Vapi
  module Chats
    module Types
      class ListChatsRequest < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false
        field :assistant_id, -> { String }, optional: true, nullable: false, api_name: "assistantId"
        field :assistant_id_any, -> { String }, optional: true, nullable: false, api_name: "assistantIdAny"
        field :squad_id, -> { String }, optional: true, nullable: false, api_name: "squadId"
        field :session_id, -> { String }, optional: true, nullable: false, api_name: "sessionId"
        field :previous_chat_id, -> { String }, optional: true, nullable: false, api_name: "previousChatId"
        field :page, -> { Integer }, optional: true, nullable: false
        field :sort_order, -> { Vapi::Chats::Types::ListChatsRequestSortOrder }, optional: true, nullable: false, api_name: "sortOrder"
        field :limit, -> { Integer }, optional: true, nullable: false
        field :created_at_gt, -> { String }, optional: true, nullable: false, api_name: "createdAtGt"
        field :created_at_lt, -> { String }, optional: true, nullable: false, api_name: "createdAtLt"
        field :created_at_ge, -> { String }, optional: true, nullable: false, api_name: "createdAtGe"
        field :created_at_le, -> { String }, optional: true, nullable: false, api_name: "createdAtLe"
        field :updated_at_gt, -> { String }, optional: true, nullable: false, api_name: "updatedAtGt"
        field :updated_at_lt, -> { String }, optional: true, nullable: false, api_name: "updatedAtLt"
        field :updated_at_ge, -> { String }, optional: true, nullable: false, api_name: "updatedAtGe"
        field :updated_at_le, -> { String }, optional: true, nullable: false, api_name: "updatedAtLe"
      end
    end
  end
end
