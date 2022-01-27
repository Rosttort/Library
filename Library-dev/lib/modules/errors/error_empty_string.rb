# frozen_string_literal: true

module Lib
  module Modules
    module Errors
      class EmptyStringError < Entity::BaseError
        STANDARD_MESSAGE = 'String was empty'
      end
    end
  end
end
