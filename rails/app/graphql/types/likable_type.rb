# frozen_string_literal: true

module Types
  class LikableType < Types::BaseUnion
    possible_types Types::UserType, Types::CompanyType

    def self.resolve_type(object, _context)
      case object
      when User
        Types::UserType
      when Company
        Types::CompanyType
      else
        raise ApplicationError::LogicError
      end
    end
  end
end
