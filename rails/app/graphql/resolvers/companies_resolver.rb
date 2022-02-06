module Resolvers
  class CompaniesResolver < BaseResolver
    type [Types::CompanyType], null: false

    def resolve(**args)b
      Company.includes(:users).all
    end
  end
end
