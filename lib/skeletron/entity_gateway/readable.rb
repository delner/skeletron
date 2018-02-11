module Skeletron
  module EntityGateway
    module Readable
      # Find entity by ID
      # id:       ID of the entity
      # Returns:  Entity object.
      #           Raises NotFoundError if no result.
      def find(id)
        raise NotImplementedError.new
      end

      # Find entity by ID
      # id:       ID of the entity
      # Returns:  Entity object.
      #           Returns null entity object if no result.
      def find_by_id(id)
        raise NotImplementedError.new
      end

      # Find entities which match all attributes
      # attributes: Hash of attributes to match
      # Returns:    Array of entity objects.
      def find_all_by(attributes = {})
        raise NotImplementedError.new
      end
    end
  end
end
