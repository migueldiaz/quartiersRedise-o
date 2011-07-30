class Documento < ActiveRecord::Base
  belongs_to :pagina
  mount_uploader :archivo,DocumentoUploader
end
