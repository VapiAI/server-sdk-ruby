# frozen_string_literal: true

require "test_helper"

describe Vapi::Internal::Types::Boolean do
  describe ".coerce" do
    it "coerces true/false" do
      assert Vapi::Internal::Types::Boolean.coerce(true)
      refute Vapi::Internal::Types::Boolean.coerce(false)
    end

    it "coerces an Integer" do
      assert Vapi::Internal::Types::Boolean.coerce(1)
      refute Vapi::Internal::Types::Boolean.coerce(0)
    end

    it "coerces a String" do
      assert Vapi::Internal::Types::Boolean.coerce("1")
      assert Vapi::Internal::Types::Boolean.coerce("true")
      refute Vapi::Internal::Types::Boolean.coerce("0")
    end

    it "passes through other values with strictness off" do
      obj = Object.new

      assert_equal obj, Vapi::Internal::Types::Boolean.coerce(obj)
    end

    it "raises an error with other values with strictness on" do
      assert_raises Vapi::Internal::Errors::TypeError do
        Vapi::Internal::Types::Boolean.coerce(Object.new, strict: true)
      end
    end
  end
end
