# encoding: utf-8
class UrlTree

	first_url_list = ""

  # Метод "Вывод на экран списка URL 1-ого уровня":
  def first_url_put
    puts "Когда-нибудь вместо этих слов мы увидим список URL 1-ого уровня!"
  end

  # Метод "Создание списка URL 1-ого уровня":
  def first_url_create
    puts "Когда-нибудь вместо этого вывода мы создадим список URL 1-ого уровня!"
  end

  # Метод "Добавить элемент в список URL 1-ого уровня":
  def first_url_add
    puts "Список URL 1-ого уровня: #first_url_list!"
  end
end
  
urls=UrlTree.new
urls.first_url_put  
urls.first_url_create
urls.first_url_add
