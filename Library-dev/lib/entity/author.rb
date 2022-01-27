# frozen_string_literal: true

module Lib
  module Entity
    class Author
      include Modules::Validator
      attr_reader :name, :bio

      def initialize(name, bio = '')
        validate_name(name)
        @name = name
        @bio = bio
      end

      private

      def validate_name(name)
        validate_class(String, name)
        validate_non_empty(name)
      end
    end
  end
end
