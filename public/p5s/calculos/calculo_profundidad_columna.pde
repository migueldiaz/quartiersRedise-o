class CalculoProfundidadColumna {
		public int columnas;

	 public CalculoProfundidadColumna(List<ComentarioForo> mensajesParent) {
		int prof = 0;
		for (ComentarioForo c : mensajesParent) {
			profLinea = 1;
			int proflinea = calculaProfundidadLinea(c);
			if (proflinea > prof)
				prof = proflinea;
		}
		this.columnas=prof;
	}

	int profLinea;
	private int calculaProfundidadLinea(ComentarioForo c) {
		if (c.children.size() > 0) {
			log.debug("calculaProf" + c.id);
			profLinea += (c.children.size() + 1);
			for (ComentarioForo ce : c.children) {
				calculaProfundidadLinea(ce);
				profLinea--;

			}
		}
		return profLinea;
	}
}
