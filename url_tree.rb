# encoding: utf-8

# ОПИСАНИЕ
# 1. В файле regions.csv хранится инф. по регионам в виде:
#   Оператор связи(лат.);Регион(лат.)
#
# 2. В файле level-1.csv хранится инф. по стартовым URL в виде:
#   Оператор связи(лат.);Домен сайта;Тип клиента;Cтартовое URL в виде шаблона
#
# 3. На основании файлов regions.csv и level-1.csv строится файл level-2.csv в виде:
#   Оператор связи(лат.);Домен сайта;Тип клиента;URL региона

$path = File.dirname(__FILE__)
$db_path = $path + '/DB'
$regions_file=$db_path + '/regions.csv'  # URL 1-ого уровня. Стартовые по кажд. ОСС
$level1_file=$db_path + '/level-1.csv'  # URL 1-ого уровня. Стартовые по кажд. ОСС
$level2_file=$db_path + '/level-2.csv'  # URL 2-ого уровня. По типу кл. и регионам

class FirstLevelUrls

  def initialize
    @first_url_hashs = Array.new # массив хэшей

    # Загрузка URL 1-ого уровня из файла level-1.csv в массив хэшей:
    if File.exists?($level1_file)
      file_obj = File.open($level1_file)
      file_obj.each {|ll| arr = ll.split(";")  # Строку файла в массив
        @first_url_hashs.push({:oss=>arr[0],   # Название ОСС (лат.)
                               :domen=>arr[1], # Доменное имя сайта ОСС
                               :b2_x=>arr[2],  # Тип клиена (корп., физ.)
                               :starting_url=>arr[3] # Стартовое URL
                             })
      }
    # Загрузка URL 1-ого уровня из тела программы в массив хэшей:
    else
      @first_url_hashs = [{:oss=>"Билайн",
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

# Создавать в объекте предыдущего (корневого) уровня?
#  def create  # Создать список URL 1-ого уровня
#    puts "\nКогда-нибудь вместо этого вывода мы создадим массив URL 1-ого уровня!"
#  end

  def add  # Добавить элемент в массив URL 1-ого уровня
    puts "\nмассив URL 1-ого уровня:"
    puts @first_url_hashs
    puts "\nВведите доменное имя сайта нового оператора:"
    input = gets
    @first_url_hashs.push(input.chomp)
    puts "\nОбновленный массив URL 1-ого уровня:"
    puts @first_url_hashs
  end
 
  def get # Возвратить массив (хэшей?) URL 1-ого уровня
	@first_url_hashs
  end
 
  def put  # Вывести на экран список URL 1-ого уровня
    puts "\nмассив URL 1-ого уровня:"
    @first_url_hashs.each{|hh| 
      puts "\n"
      puts hh[:oss]
      puts "\tДомен: #{hh[:domen]}"
      puts "\tТип клиена: #{hh[:b2_x]}"
      puts "\tСтартовое URL: #{hh[:starting_url]}"
    }
  end

  def create_next  # Создать список URL's следующего уровня
    if File.exists?($level2_file)  # Создать backup файла level-2.csv
      puts 'Улучшить операцию сохранения предыдущей версии файла. level-2.csv'
      File.rename($level2_file, "#{$level2_file}.bak")
    end
    file_obj_level2 = File.new($level2_file, "w+")
    file_obj_regions = File.open($regions_file)
    @first_url_hashs.each {|hh|
      file_obj_regions.rewind # установить указатель на начало файла
      file_obj_regions.each{|ll| # Создаем списки для каждой пары "Оператор-Тип клиента"
        arr = ll.chomp.split(";")  # Строку файла преобраз. в массив, элементы которого:
                                 # [0] - OCC (лат.)
                                 # [1] - Регион (лат.)
        if arr[0] == hh[:oss]
          tmp = hh[:starting_url].gsub("^", arr[1]) # в URL: "^" заменить на назв. региона
          file_obj_level2.puts("#{hh[:oss]};#{hh[:domen]};#{hh[:b2_x]};#{tmp}")
        end
      }
    }
  end #def
  
end

# Создание объекта:
first_urls=FirstLevelUrls.new

# Меню выбора действий:
puts "\nЧто вы хотите сделать?"
puts "Создать массив URL 1-ого уровня - нажмите 1"
puts "Добавить элемент в массив URL 1-ого уровня - нажмите 2"
puts "Вывести на экран массив URL 1-ого уровня - нажмите 3"
puts "Вывести на экран массив хэшей @first_url_hashs - нажмите 4"
puts "Создать URL 2-ого уровня - нажмите 5"
puts "Выйти из программы - любую другую клавишу"
input = gets
input = input.chomp

# case-условие:
case input.to_i
#   when 1
#     first_urls.create
   when 2
     first_urls.add
   when 3
     first_urls.put
   when 4
     puts first_urls.get
   when 5
     first_urls.create_next
   else return
end



