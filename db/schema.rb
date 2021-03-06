# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120506000227) do

  create_table "add_protagonistas_to_paginas", :force => true do |t|
    t.integer  "protagonistas_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asociacions", :force => true do |t|
    t.integer  "web_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "claves", :force => true do |t|
    t.string   "clave"
    t.integer  "jeunes_id"
    t.integer  "femmes_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colaboradors", :force => true do |t|
    t.string   "nombreEs"
    t.string   "nombreFr"
    t.boolean  "aporta"
    t.text     "infoEs"
    t.text     "infoFr"
    t.text     "direccion"
    t.string   "imagen"
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "revisado"
    t.string   "url"
    t.boolean  "revisadofr", :default => false
    t.integer  "position",   :default => 0
  end

  create_table "comentarios", :force => true do |t|
    t.text     "textoes"
    t.text     "textofr"
    t.integer  "foro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comentario_id"
    t.string   "tituloes"
    t.string   "titulofr"
    t.integer  "usuarioforo_id"
    t.boolean  "revisado",       :default => false
    t.boolean  "revisadofr"
  end

  create_table "contactos", :force => true do |t|
    t.text     "infoEs"
    t.text     "infoFr"
    t.string   "email"
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "revisado"
    t.boolean  "revisadofr",    :default => false
    t.text     "descripciones"
    t.text     "descripcionfr"
  end

  create_table "documentacions", :force => true do |t|
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documentos", :force => true do |t|
    t.string  "doces"
    t.string  "docfr"
    t.integer "pagina_id"
    t.string  "archivo"
    t.boolean "revisado"
    t.string  "archivofr"
    t.integer "foro_id"
    t.boolean "revisadofr", :default => false
    t.integer "position",   :default => 50
    t.integer "tipo",       :default => 0
  end

  create_table "enfoques", :force => true do |t|
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipos", :force => true do |t|
    t.integer  "web_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombre"
    t.text     "descripcionEs"
    t.text     "descripcionFr"
    t.boolean  "revisado"
    t.integer  "jeunes_id"
    t.integer  "femmes_id"
    t.boolean  "revisadofr",    :default => false
    t.float    "x"
    t.float    "y"
    t.string   "url"
    t.string   "imagen"
  end

  create_table "eventos", :force => true do |t|
    t.datetime "fecha"
    t.string   "tituloEs"
    t.string   "tituloFr"
    t.string   "imagen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sitio_id"
    t.boolean  "revisado",      :default => false
    t.boolean  "revisadofr",    :default => false
    t.text     "descripciones"
    t.text     "descripcionfr"
    t.string   "documento"
    t.string   "documentofr"
    t.string   "titulodoces"
    t.string   "titulodocfr"
  end

  create_table "femmes", :force => true do |t|
    t.integer  "web_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fondos", :force => true do |t|
    t.string   "imagen"
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foros", :force => true do |t|
    t.string   "tituloes"
    t.string   "titulofr"
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "revisado",      :default => false
    t.boolean  "revisadofr",    :default => false
    t.text     "descripciones"
    t.text     "descripcionfr"
  end

  create_table "imagens", :force => true do |t|
    t.string  "piefoto"
    t.string  "piefotofr"
    t.string  "imagen"
    t.integer "pagina_id"
    t.string  "imagenmini"
    t.boolean "revisado",   :default => false
    t.boolean "revisadofr", :default => false
  end

  create_table "jeunes", :force => true do |t|
    t.integer  "web_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paginas", :force => true do |t|
    t.string   "tituloes"
    t.string   "titulofr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seccion_id"
    t.boolean  "revisado",         :default => false
    t.integer  "presentacion_id"
    t.integer  "red_id"
    t.integer  "documentacion_id"
    t.integer  "pagina_id"
    t.boolean  "revisadofr",       :default => false
    t.integer  "vision_id"
    t.integer  "enfoque_id"
    t.integer  "protagonistas_id"
    t.integer  "position",         :default => 0
  end

  create_table "parrafos", :force => true do |t|
    t.text     "textoes"
    t.text     "textofr"
    t.integer  "pagina_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen"
    t.boolean  "revisado",   :default => false
    t.string   "imagenmini"
    t.string   "piefoto"
    t.string   "piefotofr"
    t.string   "tituloes"
    t.string   "titulofr"
    t.boolean  "revisadofr", :default => false
    t.integer  "position",   :default => 50
  end

  create_table "presentacions", :force => true do |t|
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "protagonistas", :force => true do |t|
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proyectos", :force => true do |t|
    t.integer  "web_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reds", :force => true do |t|
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seccions", :force => true do |t|
    t.string   "tituloes"
    t.string   "titulofr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo"
    t.integer  "presentacion_id"
    t.integer  "red_id"
    t.boolean  "revisado",        :default => false
    t.boolean  "revisadofr",      :default => false
  end

  create_table "sitios", :force => true do |t|
    t.string   "nombreEs"
    t.string   "nombreFr"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asociacion_id"
    t.integer  "proyecto_id"
    t.integer  "equipo_id"
    t.integer  "jeunes_id"
    t.integer  "femmes_id"
  end

  create_table "usuarioforos", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "clave"
    t.integer  "jeunes_id"
    t.integer  "femmes_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "idioma"
    t.integer  "equipo_id"
    t.string   "imagen"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "rol"
    t.boolean  "admin"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "sitio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "idioma"
    t.string   "tipo"
    t.string   "traduceA"
  end

  create_table "videos", :force => true do |t|
    t.string   "tituloes"
    t.string   "titulofr"
    t.text     "html"
    t.integer  "pagina_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail"
    t.integer  "position",   :default => 0
    t.integer  "tipo",       :default => 0
  end

  create_table "visions", :force => true do |t|
    t.integer "sitio_id"
  end

  create_table "webs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
