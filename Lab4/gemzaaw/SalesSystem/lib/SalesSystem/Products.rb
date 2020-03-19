module Products
    class Product
        def initialize(name, category, netto)
            @name = name
            if category.class <= Category
                @category = category
            else
                raise ArgumentError
            end
            @netto = netto
        end

        def price
            return @netto*(100+@category.vat)/100
        end

        def netto
            @netto
        end

        def name
            @name
        end
    end
end