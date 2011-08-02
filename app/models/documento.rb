class Documento < ActiveRecord::Base
  belongs_to :pagina
  mount_uploader :archivo,DocumentoUploader
  mount_uploader :archivofr,DocumentoUploader
end
