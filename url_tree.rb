# encoding: utf-8

$path = File.dirname(__FILE__)
$db_path = $path + '/DB'
$level1_file=$db_path + '/level-1.csv'

class FirstLevelUrls

  def initialize  # Метод "Инициализация"
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
  end

  def create  # Метод "Создание списка URL 1-ого уровня"
    puts "\nКогда-нибудь вместо этого вывода мы создадим массив URL 1-ого уровня!"
  end

  def add  # Метод "Добавить элемент в массив URL 1-ого уровня"
    puts "\nмассив URL 1-ого уровня:"
    puts @first_url_list
    puts "\nВведите доменное имя сайта нового оператора:"
    input = gets
    @first_url_list.push(input.chomp)
    puts "\nОбновленный массив URL 1-ого уровня:"
    puts @first_url_list
  end
 
  def get # Метод "Возвратить массив (хэшей?) URL 1-ого уровня"
	@first_url_list
  end
 
  def put  # Метод "Вывод на экран списка URL 1-ого уровня"
    puts "\nмассив URL 1-ого уровня:"
    for tmp_arr in @first_url_list
      puts "\n"
      puts tmp_arr[:oss]
      puts "\tДомен: #{tmp_arr[:domen]}"
      puts "\tТип клиена: #{tmp_arr[:b2_x]}"
      puts "\tСтартовое URL: #{tmp_arr[:starting_url]}"
    end
  end

  def create_next  # Создание списка URL's следующего уровня
    
  end
  
end

# Создание объекта:
first_urls=FirstLevelUrls.new

# Меню выбора действий:
puts "\nЧто вы хотите сделать?"
puts "Создать массив URL 1-ого уровня - нажмите 1"
puts "Добавить элемент в массив URL 1-ого уровня - нажмите 2"
puts "Вывести на экран массив URL 1-ого уровня - нажмите 3"
puts "Вывести на экран результат работы метода get - нажмите 4"
puts "Выйти из программы - любую другую клавишу"
input = gets
input = input.chomp

# case-условие:
case input.to_i
   when 1
     first_urls.create
   when 2
     first_urls.add
   when 3
     first_urls.put
   when 4
     puts first_urls.get
   else return
end



