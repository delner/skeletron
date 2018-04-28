module Skeletron
  module EntityGateway
    module Updatable
      # Update entity by ID
      # id:         ID of the entity
      # attributes: Hash of attributes to update
      # Returns:    Integer count of entities updated.
      def update(id:, attributes: {})
        raise NotImplementedError.new
      end

      # Update all entities which match all attributes
      # by:         Hash of attributes to match
      # with:       Hash of attributes to update
      # Returns:    Integer count of entities updated.
      def update_all(by: {}, with: {})
        raise NotImplementedError.new
      end
    end
  end
end
