module Skeletron
  module EntityGateway
    module Deletable
      # Delete entity by ID
      # id:         ID of the entity
      # Returns:    true.
      def delete(id)
        raise NotImplementedError.new
      end

      # Delete all entities which match all attributes
      # attributes: Hash of attributes to match
      # Returns:    Integer count of entities deleted.
      def delete_all(attributes = {})
        raise NotImplementedError.new
      end
    end
  end
end
