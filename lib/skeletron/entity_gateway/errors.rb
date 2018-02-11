module Skeletron
  module EntityGateway
    class NotFoundError < StandardError
      attr_reader :id

      def initialize(id)
        @id = id
      end

      def message
        "No entity found for ID '#{id}'!"
      end
    end
  end
end
