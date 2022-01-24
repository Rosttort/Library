# frozen_string_literal: true

module Lib
  module Entity
    class Book
      include Modules::Validator
      attr_reader :title, :author

      def initialize(title, author)
        validate_data(title, author)
        @title = title
        @author = author
      end

      def to_s
        " Title: \"#{title}\"\n\ Author: #{author.name}"
      end

      private

      def validate_data(title, author)
        validate_class(String, title)
        validate_non_empty(title)
        validate_class(Author, author)
      end
    end
  end
end
