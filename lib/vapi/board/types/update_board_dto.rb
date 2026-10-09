# frozen_string_literal: true

module Vapi
  module Board
    module Types
      class UpdateBoardDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :items, -> { Internal::Types::Array[Vapi::Board::Types::UpdateBoardDtoItemsItem] }, optional: true, nullable: false
        field :name, -> { String }, optional: true, nullable: false
        field :layout, -> { Vapi::Types::BoardLayout }, optional: true, nullable: false
        field :time_range_override, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRangeOverride"
      end
    end
  end
end
