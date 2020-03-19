module Categories
    class Category
        def initialize(name, vat)
            @vat = vat
            @name = name
        end

        def vat
            @vat
        end
    end
    class Food < Category
        def initialize(name, vat)
            super(name, vat)
        end
    end
    class Alcohol < Category
        def initialize(name, vat)
            super(name, vat)
        end
    end
    class Cosmetics < Category
        def initialize(name, vat)
            super(name, vat)
        end
    end
end