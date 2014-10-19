# encoding: UTF-8

UserRole.delete_all
UserRole.reset_pk_sequence
UserRole.create(:name => "CompanyUser")
UserRole.create(:name => "ClientUSer")

Country.delete_all
Country.reset_pk_sequence
Country.create!(:name => "Argentina")

Title.delete_all
Title.reset_pk_sequence
Title.create!(:name => "Ind. Masculina", :icon_name =>"indumentaria-masculina")
Title.create!(:name => "Ind. Femenina", :icon_name =>"indumentaria-femenina")
Title.create!(:name => "Ninos", :icon_name =>"nenes")
Title.create!(:name => "Gastronomia", :icon_name =>"gastronomia")
Title.create!(:name => "Viajes y Hoteles", :icon_name =>"viajes")
Title.create!(:name => "Belleza", :icon_name =>"belleza")
Title.create!(:name => "Deportes", :icon_name =>"deporte")
Title.create!(:name => "Cine", :icon_name =>"cine")
Title.create!(:name => "Teatro", :icon_name =>"teatro")
Title.create!(:name => "Electronica", :icon_name =>"electronicos")
Title.create!(:name => "Estudio", :icon_name =>"estudio")
Title.create!(:name => "Hogar", :icon_name =>"hogar")

Question.delete_all
Question.reset_pk_sequence

Question.create!(:question => "Quién fue el creador del pensamiento filosófico conocido como Objetivismo y autor
      de los bestsellers 'El manantial' y 'La rebelión de Atlas'?", :correct_answer => "Ayn Rand", :answer1 => "Nathaniel Branden",
      :answer2 => "George Breisman", :answer3 => "Jimmy Wales")

Question.create!(:question => "Qué equipo de fútbol fue el ganador de la primera edición de la copa argentina?",
      :correct_answer => "Boca Juniors", :answer1 => "River Plate", :answer2 => "Racing Club", :answer3 => "San Lorenzo")

Question.create!(:question => "Cuál era el verdadero nombre del vocalista de la banda británica Queen?",
                 :correct_answer => "Farrokh Bulsara", :answer1 => "Frederick Mercury",
                 :answer2 => "Freddie Mercury", :answer3 => "Larry Lurex")

Question.create!(:question => "En que barrio se encuentra el monumento argentino conocido como 'El obelisco'?",
                 :correct_answer => "San Nicolas", :answer1 => "Recoleta", :answer2 => "Retiro", :answer3 => "Barrio Norte")

Question.create!(:question => "Quién fue el autor del libro '1984'?", :correct_answer => "Orson Wells",
                 :answer1 => "Stephen King", :answer2 => "Ray Bradbury", :answer3 => "Vladimir Nabokov")

Question.create!(:question => "En qué ciudad fue abierto el primer local de la cadena de cafeterías Starbucks?",
                 :correct_answer => "Seattle", :answer1 => "New York", :answer2 => "San Francisco", :answer3 => "Miami")

Question.create!(:question => "Quién fue el autor de 'Las tres leyes de la robótica'?", :correct_answer => "Isaac Asimov",
                 :answer1 => "Stephen Hawkins", :answer2 => "Orson Wells", :answer3 => "Albert Einsten")

Question.create!(:question => "Quién fue el primer hombre en el espacio", :correct_answer => "Yuri Gagarin",
                 :answer1 => "Neil Amstrong", :answer2 => "Alan Sheppard", :answer3 => "Laika")

Question.create!(:question => "Cuál de estos nombres no corresponde a un personaje de la serie 'Friends'?",
                 :correct_answer => "Pete", :answer1 => "Ross",:answer2 => "Chandler", :answer3 => "Joey")

Question.create!(:question => "En que año fue inaugurado el teatro Colon?", :correct_answer => "1908", :answer1 => "1892",
                 :answer2 => "1934", :answer3 => "1912")

Question.create!(:question => "A quién se le atribuye el descubrimiento de la penicilina?", :correct_answer => "Alexander Fleming",
                 :answer1 => "Jonas Salk", :answer2 => "Marie Curi", :answer3 => "Ramoncita Del Piero")

Question.create!(:question => "Qué es lo que transforma a los Mogwai en Gremlins asesinos?",
                 :correct_answer => "Darles de comer luego de las doce", :answer1 => "Mojarlos",
                 :answer2 => "La luz solar", :answer3 => "Golpearlos en la cabeza")

Question.create!(:question => "Según el censo internacional realizado por la ONU, en que año la población de las ciudades superó en número a la del campo",
                 :correct_answer => "2008", :answer1 => "1896", :answer2 => "1923", :answer3 => "1965")

Question.create!(:question => "Argentina se divide políticamente en:",
                 :correct_answer => "23 provincias y la ciudad autónoma de buenos aires",
                 :answer1 => "22 provincias y la ciudad autónoma de buenos aires",:answer2 => "24 provincias", :answer3 => "23 provincias")

Question.create!(:question => "Quién escribió la 'Marcha de San Lorenzo'?",
                 :correct_answer => "Cayetano Alberto Silva", :answer1 => "Antonio Alberti",:answer2 => "Manuel Sanchez",
                 :answer3 => "Mariano Pepe Salvatore")

Question.create!(:question => "Cuál de las siguientes fórmulas corresponde al peróxido de hidrógeno?",
                 :correct_answer => "H2O2", :answer1 => "H20",:answer2 => "CO2", :answer3 => "0H")

Question.create!(:question => "Qué famoso guitarrista utiliza una guitarra hecha por el mismo y su padre, cuando tenía solo 15 años?",
                 :correct_answer => "Brian Harold May", :answer1 => "George Harrison",:answer2 => "Steve Vai", :answer3 => "Jimmy Page")

Question.create!(:question => "Cuál es la relación de volumen entre la Tierra y el Sol",
                 :correct_answer => "1.300.000:1", :answer1 => "2.250.00:1",:answer2 => "125.000:1", :answer3 => "120:1")

Question.create!(:question => "De qué nacionalidad fue el escritor Oscar Wilde?",
                 :correct_answer => "Irlandes", :answer1 => "Ingles",:answer2 => "Frances", :answer3 => "Español")


NewsletterFrequency.delete_all
NewsletterFrequency.reset_pk_sequence
NewsletterFrequency.create!(:name => "Nunca", :days =>0)
NewsletterFrequency.create!(:name => "Una vez por semana", :days =>1)
NewsletterFrequency.create!(:name => "A diario", :days =>7)

ImageQuestion.delete_all
ImageQuestion.reset_pk_sequence
ImageQuestion.create!(:url => "http://www.brandfinance.com/images/flags/large/nl.png", :question =>"De qué país es la bandera?", :answer =>"Holanda")
ImageQuestion.create!(:url => "http://www.banderas.pro/banderas/bandera-colombia-3.gif", :question =>"De qué país es la bandera?", :answer =>"Colombia")
ImageQuestion.create!(:url => "http://www.banderas.pro/banderas/bandera-rusia-4.gif", :question =>"De qué país es la bandera?", :answer =>"Rusia")
ImageQuestion.create!(:url => "http://www.bandetex.com/resources/archivosbd/productos_galeria/7f0bf4597951c063a11f2780aa58c2c6.jpg", :question =>"De qué país es la bandera?", :answer =>"Rusia")
ImageQuestion.create!(:url => "http://images.nationalgeographic.com/wpf/media-live/photos/000/002/cache/arabian-camel_223_600x450.jpg", :question =>"Qué animal es?", :answer =>"camello")
ImageQuestion.create!(:url => "http://www.ihotwallpapers.com/wp-content/uploads/2014/09/Pepsi-logo-9.jpg", :question =>"Qué marca es?", :answer =>"Pepsi")
ImageQuestion.create!(:url => "http://www.armino.ro/wp-content/uploads/2009/09/audi_logo.jpg", :question =>"Qué marca es?", :answer =>"Audi")
ImageQuestion.create!(:url => "http://marketing.blogs.ie.edu/archives/NT_SANTANDER.jpg", :question =>"Qué marca es?", :answer =>"Santander")
ImageQuestion.create!(:url => "http://i46.tinypic.com/23wmro1.png", :question =>"Qué película es?", :answer =>"Matrix")
ImageQuestion.create!(:url => "http://burdo.co/wp-content/uploads/2014/03/regreso-al-futuro.jpg", :question =>"Qué película es?", :answer =>"Volver al futuro")
ImageQuestion.create!(:url => "http://i.telegraph.co.uk/multimedia/archive/02472/yoda_2472331b.jpg", :question =>"Qué película es?", :answer =>"Star Wars")
ImageQuestion.create!(:url => "http://www.radioimagina.cl/wp-content/blogs.dir/103/files/2012/04/Pretty-Woman.jpg", :question =>"Qué película es?", :answer =>"Mujer Bonita")
ImageQuestion.create!(:url => "http://compostimes.com/wp-content/uploads/2013/10/led-zeppelin.jpg", :question =>"Qué banda es?", :answer =>"Led Zeppelin")
ImageQuestion.create!(:url => "http://www.escuchar-musica-espagnola.com/images/Soda-Stereo.jpg", :question =>"Qué banda es?", :answer =>"Soda Stereo")
ImageQuestion.create!(:url => "http://www.elmoremagazine.com/wp-content/uploads/2014/08/e7a766252452a389eca473b820a06a30.jpg", :question =>"Qué banda es?", :answer =>"Aerosmith")




