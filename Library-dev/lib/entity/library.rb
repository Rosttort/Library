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
        @orders.group_by(&:reader).sort_by { |orders| -orders.uniq.size }.first(amount).map(&:first)
      end

      def top_books(amount = 1)
        @orders.group_by(&:book).sort_by { |orders| -orders.uniq.size }.first(amount).map(&:first)
      end

      def number_of_readers_of_the_most_popular_books(amount = 3)
        @orders.select { |order| top_books(amount).include?(order.book) }.map(&:reader).uniq.size
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
    end
  end
end
