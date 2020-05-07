class Usuario < ApplicationRecord
	belongs_to :estados
	##se establece el contexto y una relacion con la tabla estado
end
