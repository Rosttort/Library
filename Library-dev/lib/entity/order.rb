# frozen_string_literal: true

module Lib
  module Entity
    class Order
      include Modules::Validator
      attr_reader :book, :reader, :date

      def initialize(book, reader, date = Date.today)
        validate_data(book, reader, date)
        @book = book
        @reader = reader
        @date = date
      end

      private

      def validate_data(book, reader, date)
        validate_class(Book, book)
        validate_class(Reader, reader)
        validate_class(Date, date)
      end
    end
  end
end
