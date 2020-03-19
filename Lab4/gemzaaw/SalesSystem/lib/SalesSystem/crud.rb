require "sqlite3"

module Crud
    class Database
        def initialize(db_name)
            @db_name = db_name
            if File.exists?(@db_name)
                File.delete(@db_name)
            end

        end

        def delete()
            begin
                File.delete(@db_name)
                return "success"
            rescue
                return "fail"
            end
        end

        def print_clients()

        end

        def insert_client(client_id, first_name, last_name)

        end

        def insert_product(product_id, name, category_id, netto)

        end

        def insert_category(category_id, name, vat)

        end

        def insert_cart(cart_id, client_id, product_id)

        end

        def read_client(first_name, last_name)

        end

        def read_product(name)

        end

        def read_category(name)

        end

        def read_cart(client_id)

        end

        def read_cost(client_id)

        end

        def update_client(old_first, old_last, new_first, new_last)

        end

        def update_category(old_name, new_name, new_vat)

        end

        def update_product(old_name, new_name, new_category_id, new_netto)

        end

        def del_client(first_name, last_name)

        end

        def del_category(name)

        end

        def del_product(name)

        end
    end
end