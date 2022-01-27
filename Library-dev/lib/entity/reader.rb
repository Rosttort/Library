# frozen_string_literal: true

module Lib
  module Entity
    class Reader
      include Modules::Validator
      attr_reader :name, :email, :city, :street, :house

      def initialize(name, email, city, street, house)
        validate_data(name, email, city, street, house)
        @name = name
        @email = email
        @city = city
        @street = street
        @house = house
      end

      def to_s
        " Name: #{name}\n\ Email: #{email}\n\ City: #{city}\n\ Street: #{street} #{house}"
      end

      private

      def validate_data(name, email, city, street, house)
        [name, email, city, street].each do |string|
          validate_class(String, string)
          validate_non_empty(string)
        end
        validate_class(Integer, house)
        validate_positive(house)
      end
    end
  end
end
