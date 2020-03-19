require 'yaml'
require 'set'
require 'getoptlong'

def add_book(library, title)
    book = Array.new
    authors = Array.new
    categories = Array.new
    book[0] = title
    book[1] = authors
    book[2] = categories
    if library[title] == nil
        library[title] = book
    end
end

def add_book_full(library, title, author, category)
    book = Array.new
    authors = Array.new
    categories = Array.new
    book[0] = title
    book[1] = authors
    book[2] = categories
    if library[title] == nil
        library[title] = book
    end
    add_author(library, title, author)
    add_category(library, title, category)
end

def add_author(library, title, author)
    if library[title] != nil
        library[title][1].push(author)
    end
end

def add_category(library, title, category)
    if library[title] != nil
        library[title][2].push(category)
    end
end

def delete_book(library, title)
    library.delete(title)
end

def delete_author(library, title, author)
    library[title][1].pop(author)
end

def delete_category(library, title, category)
    library[title][2].pop(category)
end

def find_category(library, category)
    result = Array.new
    for title in library.keys
        if library[title][2].include?(category)
            result.push(title)
        end
    end
    return result 
end

def print_author(library, author)
    for title in library.keys
        if library[title][1].include?(author)
            print_book(library, title)
        end
    end
end

def print_category(library, category)
    print "Category ", category, ":\n"
    titles = find_category(library, category)
    for title in titles
        print_book(library, title)
    end
    print "\n\n"
end

def print_categories(library)
    categories = Set.new()
    for title in library.keys
        categories.merge(library[title][2])
    end
    for category in categories
        print_category(library, category)
    end
end

def print_book(library, tit)
    for title in library.keys
        if title.include?(tit)
            print "Title:\t", library[title][0], "\n"
            print "Author(s):\t"
            for author in library[title][1]
                print author, ", "
            end
            print "\n", "Categories:\t"
            for category in library[title][2]
                print category, ", "
            end
            print "\n\n"
        end
    end
end

def save_library(library)
    File.open("library.yml", "w") { |file| file.write(library.to_yaml) }
end

def console(library) 
    opts = GetoptLong.new(
        [ '--help', '-h', GetoptLong::NO_ARGUMENT],
        [ '--title', GetoptLong::REQUIRED_ARGUMENT],
        [ '--author', GetoptLong::REQUIRED_ARGUMENT],
        [ '--category', GetoptLong::REQUIRED_ARGUMENT],
        [ '--delete', GetoptLong::OPTIONAL_ARGUMENT],
        [ '--show', GetoptLong::OPTIONAL_ARGUMENT]
    )
    to_delete = false
    to_show = false
    title = ""
    author = ""
    category = ""

    opts.each do |opt, arg|
        library = YAML.load(File.read("library.yml"))

        case opt
            when '--help'
                puts <<-EOF
    ===================HELP=========================
    --title <arg>    :   Zdefiniuj tytuł
    --author <arg>   :   Zdefiniuj autora
    --category <arg> :   Zdefiniuj kategorie
    --delete         :   Usun ksiazke o podanych danych
    --show           :   Pokaz ksiazke o podanych danych  
                    EOF
                return
            when '--delete'
                to_delete = true
            when '--title'
                title = arg.to_s
            when '--author'
                author = arg.to_s
            when '--category'
                category = arg.to_s
            when '--show'
                to_show = true
                to_delete = false
        end
    end

    if to_delete
        if title == ""
            print "Nie podano nazwy usuwanej ksiązki\n"
        else
            if author == ""
                if category == ""
                    delete_book(library, title)
                else
                    delete_category(library, title, category)
                end
            else
                delete_author(library, title, author)
                if category != ""
                    delete_category(library, title, category)
                end 
            end
        end
    else
        if to_show
            if title == ""
                if category == "all"
                    print_categories(library)
                elsif category != ""
                    print_category(library, category)
                end
                if author != ""
                    print_author(library, author)
                end
            else
                print_book(library, title)
            end
        else
            if title == ""
                print "Nie podano nazwy dodawanej ksiązki\n"
            else
                add_book(library, title)
                if author != ""
                    add_author(library, title, author)
                end
                if category != ""
                    add_category(library, title, category)
                end
            end
        end
    end
    save_library(library)
end

library = Hash.new
console(library)
