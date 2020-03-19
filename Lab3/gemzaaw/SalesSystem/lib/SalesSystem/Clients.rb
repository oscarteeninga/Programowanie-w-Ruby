module Clients
    class Client
        @@id_count = 0
        def initialize(first_name, last_name)
            @first_name = first_name
            @last_name = last_name
            @products = []
            @@id_count += 1
            @ID = @@id_count
            @discount = 0
            @cart = 0
        end

        def first_name
            @first_name
        end

        def last_name
            @last_name
        end

        def first_name= (new_name)
            @first_name = new_name
        end

        def last_name= (new_name)
            @last_name = new_name
        end

        def to_s
            to_print = "#{@first_name} #{@last_name}\n\nRabat=#{@discount}%\n\n"
            for i in @products
                to_print += "#{i.name}\n"
            end
            to_print += "\n"
            sum = @cart*(100-@discount)/100
            to_print += "Suma=#{sum}\n"
        end

        def products
            return @products
        end

        def add_product(product)
            if (product.class != Product)
                raise ArgumentError
            end
            @products.push(product)
            @cart += product.price
            if (@products.length >= 5)
                @discount = 10
            end
        end

        def id
            @ID
        end

        def has_discount?
            return @discount > 0
        end
    end
end

