# frozen_string_literal: true

module Vapi
  module Board
    module Types
      class CreateBoardDto < Internal::Types::Model
        field :items, -> { Internal::Types::Array[Vapi::Board::Types::CreateBoardDtoItemsItem] }, optional: true, nullable: false
        field :name, -> { String }, optional: false, nullable: false
        field :layout, -> { Vapi::Types::BoardLayout }, optional: false, nullable: false
        field :time_range_override, -> { Vapi::Types::InsightTimeRangeWithStep }, optional: true, nullable: false, api_name: "timeRangeOverride"
      end
    end
  end
end
