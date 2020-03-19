require "sqlite3"

module Crud
    class Database
        def initialize(db_name)
            @db_name = db_name
            if File.exists?(@db_name)
                File.delete(@db_name)
            end
            database = SQLite3::Database.new(@db_name)
            # Create tables
            database.execute <<-SQL
                create table clients (
                    client_id int,
                    first_name varchar(30),
                    last_name varchar(30)
                );
            SQL
            database.execute <<-SQL  
                create table products (
                    product_id int,
                    name varchar(30),
                    category_id int,
                    netto_price int
                );
            SQL
            database.execute <<-SQL
                create table categories (
                    category_id int,
                    name varchar(30),
                    vat int
                );
            SQL
            database.execute <<-SQL
                create table cart (
                    cart_id int,
                    client_id int,
                    product_id int
                );
            SQL
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
            database = SQLite3::Database.new(@db_name)
            return database.execute("select first_name, last_name from clients")
        end

        def insert_client(client_id, first_name, last_name)
            database = SQLite3::Database.new(@db_name)
            database.execute(
                "insert into clients (client_id, first_name, last_name)
                values (?, ?, ?)", [client_id, first_name, last_name]
            )
        end

        def insert_product(product_id, name, category_id, netto)
            database = SQLite3::Database.new(@db_name)
            database.execute(
                "insert into products (product_id, name, category_id, netto_price)
                values (?, ?, ?, ?)", [product_id, name, category_id, netto]
            )
        end

        def insert_category(category_id, name, vat)
            database = SQLite3::Database.new(@db_name) 
            database.execute(
                "insert into categories (category_id, name, vat)
                values (?, ?, ?)", [category_id, name, vat]
            )
        end

        def insert_cart(cart_id, client_id, product_id)
            database = SQLite3::Database.new(@db_name) 
            database.execute(
                "insert into cart (cart_id, client_id, product_id)
                values (?, ?, ?)", [cart_id, client_id, product_id]
            )
        end

        def read_client(first_name, last_name)
            database = SQLite3::Database.new(@db_name)
            return database.execute("select * from clients where ? = first_name and ? = last_name", [first_name, last_name])
        end

        def read_product(name)
            database = SQLite3::Database.new(@db_name)
            return database.execute("select * from products where ? = name", [name])
        end

        def read_category(name)
            database = SQLite3::Database.new(@db_name)
            return database.execute("select * from categories where ? = name", [name])
        end

        def read_cart(client_id)
            database = SQLite3::Database.new(@db_name)
            return database.execute(
                "select p.name from cart as c
                 inner join products as p 
                 on c.product_id = p.product_id
                 where ? = c.client_id", [client_id]
            )
        end

        def read_cost(client_id)
            database = SQLite3::Database.new(@db_name)
            return database.execute(
                "select sum(p.netto_price*(100+c.vat)/100)
                 from products as p
                 inner join categories as c
                 on c.category_id = p.category_id
                 inner join cart as ca
                 on ca.product_id = p.product_id
                 group by ca.client_id
                 having ca.client_id = ?", [client_id]
            )[0][0].to_i
        end

        def update_client(old_first, old_last, new_first, new_last)
            database = SQLite3::Database.new(@db_name)
            database.execute("update clients
                              set first_name = ?, last_name = ?
                              where first_name = ? and last_name = ?",
                              [new_first, new_last, old_first, old_last])
        end

        def update_category(old_name, new_name, new_vat)
            database = SQLite3::Database.new(@db_name)
            database.execute("update categories
                              set name = ?, vat = ?
                              where name = ?",
                              [new_name, new_vat, old_name])
        end

        def update_product(old_name, new_name, new_category_id, new_netto)
            database = SQLite3::Database.new(@db_name)
            database.execute("update products
                              set name = ?, category_id = ?, netto_price = ?
                              where name = ?",
                              [new_name, new_category_id, new_netto, old_name])
        end

        def del_client(first_name, last_name)
            database = SQLite3::Database.new(@db_name)
            database.execute(
                "delete from clients
                where ? = first_name and ? = last_name",
                [first_name, last_name]
            )
        end

        def del_category(name)
            database = SQLite3::Database.new(@db_name)
            database.execute(
                "delete from categories
                where ? = name", [name]
            )
        end

        def del_product(name)
            database = SQLite3::Database.new(@db_name)
            database.execute(
                "delete from products
                where ? = name", [name]
            )
        end
    end
end