# encoding: utf-8
class UrlTree

# Метод "Инициализация":
  def initialize(first_url_list = ["beeline.ru", "megafon.ru", "mts.ru", "tele2.ru"])
    # Список url 1-ого уровня
    @first_url_list = first_url_list
  end

# Метод "Вывод на экран списка URL 1-ого уровня":
  def first_url_put
    puts "\nСписок URL 1-ого уровня:"
    puts @first_url_list
  end

# Метод "Создание списка URL 1-ого уровня":
  def first_url_create
    puts "\nКогда-нибудь вместо этого вывода мы создадим список URL 1-ого уровня!"
  end

# Метод "Добавить элемент в список URL 1-ого уровня":
  def first_url_add
    puts "\nСписок URL 1-ого уровня:"
    puts @first_url_list
    puts "\nВведите доменное имя сайта нового оператора:"
    input = gets
    @first_url_list.push(input.chomp)
    puts "\nОбновленный список URL 1-ого уровня:"
    puts @first_url_list
  end
end

# Меню выбора действий:
puts "\nЧто вы хотите сделать?"
puts "Создать список URL 1-ого уровня - нажмите 1"
puts "Добавить элемент в список URL 1-ого уровня - нажмите 2"
puts "Вывести на экран списка URL 1-ого уровня - нажмите 3"
puts "Выйти из программы - любую другую клавишу"
input = gets
input = input.chomp

# Создание объекта:
urls=UrlTree.new ["beeline.ru", "megafon.ru", "mts.ru", "tele2.ru"]

# case-условие:
case input.to_i
   when 1
     urls.first_url_create
   when 2
     urls.first_url_add
   when 3
     urls.first_url_put  
   else return
end



