module Skeletron
  module EntityGateway
    # Represents an type that is capable of performing transactions
    module Transactor
      # Runs a transaction.
      # block:    Proc that defines transaction body of work.
      #           When block finishes, changes are committed or rolled back.
      # Returns:  `block` return value.
      def transaction(&block)
        raise NotImplementedError.new
      end
    end
  end
end
