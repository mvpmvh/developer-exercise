module CoreExtensions
    module Enumerable
      module Where
        
        def where(criteria=nil)
          valid_arguments = !criteria.nil? || block_given?
          raise ArgumentError, 'No block given and criteria is nil' unless valid_arguments

          found = []
          each do |value|
            if block_given?
              found << value if yield(value) 
            else
              found << value if matched?(criteria, value)
            end
          end
          
          found
        end

        private

        def matched?(criteria, value)
          return hash_matches?(criteria, value) if criteria.respond_to?(:to_h)
          return regex_matches?(criteria, value) if criteria.respond_to?(:match)
          # TODO - add more criteria as needed...
          criteria == value
        end

        def hash_matches?(criteria, value)
          mismatched = criteria.any?{ |k, v| !value.has_key?(k) || !matched?(v, value[k]) }

          !mismatched
        end

        def regex_matches?(criteria, value)
          return criteria.match(value) != nil
        end
      end
    end
  end