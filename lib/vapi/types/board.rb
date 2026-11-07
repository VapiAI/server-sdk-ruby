# frozen_string_literal: true

module Vapi
  module Types
    class Board < Internal::Types::Model
      field :items, -> { Internal::Types::Array[Vapi::Types::BoardItemsItem] }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :system_key, -> { String }, optional: true, nullable: false, api_name: "systemKey"
      field :name, -> { String }, optional: false, nullable: false
      field :layout, -> { Vapi::Types::BoardLayout }, optional: false, nullable: false
      field :time_range_override, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRangeOverride"
    end
  end
end
