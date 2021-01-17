require 'net/http'

module Staccato
  module Adapter
    module Net
      class HTTP # The net/http Standard Library Adapter
        def initialize(uri)
          @uri = uri
        end

        def post(params)
          Thread.new do
            ::Net::HTTP.post_form(@uri, params)
          end
        end
      end
    end
  end
end
