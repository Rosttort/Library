# frozen_string_literal: true

module Lib
  module Entity
    include Modules::Validator
    STORAGE_FILE = 'store.yml'
    attr_reader :authors, :books, :readers, :orders

    require_relative '../../autoload'

    class Library
      def initialize
        @storage = Storage.new
        data = @storage.data
        @authors = data[:authors]
        @books = data[:books]
        @readers = data[:readers]
        @orders = data[:orders]
      end

      def save
        @storage.save
      end

      def top_readers(amount = 1)
        top_objects_orders(:reader, :book, amount)
      end

      def most_popular_books(amount = 1)
        top_objects_orders(:book, :reader, amount)
      end

      def number_of_readers_of_the_most_popular_books(amount = 3)
        @orders.select { |order| most_popular_books(amount).include?(order.book) }.uniq(&:reader).count
      end

      def add(object)
        group = case object
                when Author then @authors
                when Book   then @books
                when Reader then @readers
                when Order  then @orders
                else
                  raise UnexpectedClassError
                end

        group << object
      end

      private

      def top_objects_orders(grouper, uniquer, amount)
        @orders.group_by(&grouper).transform_values { |values| values.uniq(&uniquer).count }
               .to_a.max_by(amount, &:last).map(&:first)
      end
    end
  end
end
