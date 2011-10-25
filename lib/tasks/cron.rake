task :cron => :environment do
 
  puts "Notificacion mensajes"
  AvisoMailer.notifica
  puts "Hecho"
  

end
