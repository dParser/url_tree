#encoding: utf-8

$path = File.dirname(__FILE__)
require "#{$path}/1_level_url"

# Создаем объект URL 1-ого уровня (URL-1):
first_urls=FirstLevelUrls.new

# Меню выбора действий с URL-1:
puts "\nОперации с URL 1-ого уровня"
puts "Добавить элемент в массив URL - нажать 1"
puts "Вывести на экран массив URL - нажать 2"
puts "Вывести на экран массив хэшей @first_url_hashs - нажать 3"
puts "Создать URL 2-ого уровня - нажать 4"
puts "Проверить корректность URL (HTTP код) - нажать 5"
puts "Перейти на операции с URL 2-ого уровня - нажать 6"
puts "Выйти из программы - любая другая клавиша"
input = gets
input = input.chomp

# case-условие:
case input.to_i
   when 1
     first_urls.add
   when 2
     first_urls.put
   when 3
     puts first_urls.get
   when 4
     first_urls.create_next
   when 5
     first_urls.check_url
   else return
end