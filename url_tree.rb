# encoding: utf-8

$path = File.dirname(__FILE__)
$db_path = $path + '/DB'
$level1_file=$db_path + '/level-1.csv'

class UrlTree

# Метод "Инициализация":
  def initialize
    @first_url_list = Array.new

    # Загрузка Хэша 1-ого уровня из файла level-1.csv:
    if File.exists?($level1_file)
      file_obj = File.open($level1_file)
      file_obj.each {|line| tmp_arr = line.split(";")  # Строку из файла "загоняем" а массив
                              @first_url_list.push({:oss=>tmp_arr[0],   # Название ОСС (лат.)
                                                    :domen=>tmp_arr[1], # Доменное имя сайта ОСС
                                                    :b2_x=>tmp_arr[2],  # Тип клиена (корп., физ.)
                                                    :starting_url=>tmp_arr[3] # Стартовое URL
                                                   }
                                                  )
                    }
    # Загрузка Хэша 1-ого уровня непосредственно из тела программы:
    else
      @first_url_list = [{:oss=>"Билайн",
                         :domen=>"beeline.ru",
                         :b2_x=>"b2c",
                         :starting_url=>"https://moskva.beeline.ru/customers/products/"
                        },
                        {:oss=>"Мегафон",
                         :domen=>"megafon.ru",
                         :b2_x=>"b2c",
                         :starting_url=>"https://moscow.megafon.ru/"
                        },
                        {:oss=>"МТС",
                         :domen=>"mts.ru",
                         :b2_x=>"b2c",
                         :starting_url=>"http://www.mts.ru/"
                        },
                        {:oss=>"TELE2",
                         :domen=>"tele2.ru",
                         :b2_x=>"b2c",
                         :starting_url=>"https://msk.tele2.ru/?pageParams=askForRegion%3Dtrue"
                        },
                        {:oss=>"Мотив",
                         :domen=>"motivtelecom.ru",
                         :b2_x=>"b2c",
                         :starting_url=>"http://motivtelecom.ru/ekb/"
                        }
                       ]
    end
#    # Список url 1-ого уровня
#    @first_url_list = first_url_list
  end

# Метод "Вывод на экран списка URL 1-ого уровня":
  def first_url_put
    puts "\nСписок URL 1-ого уровня:"
    for tmp_arr in @first_url_list
      puts "\n"
      puts tmp_arr[:oss]
      puts "\tДомен: #{tmp_arr[:domen]}"
      puts "\tТип клиена: #{tmp_arr[:b2_x]}"
      puts "\tСтартовое URL: #{tmp_arr[:starting_url]}"
    end
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

# Создание объекта:
urls=UrlTree.new #["beeline.ru", "megafon.ru", "mts.ru", "tele2.ru"]


# Меню выбора действий:
puts "\nЧто вы хотите сделать?"
puts "Создать список URL 1-ого уровня - нажмите 1"
puts "Добавить элемент в список URL 1-ого уровня - нажмите 2"
puts "Вывести на экран списка URL 1-ого уровня - нажмите 3"
puts "Выйти из программы - любую другую клавишу"
input = gets
input = input.chomp

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



