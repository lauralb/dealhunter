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




