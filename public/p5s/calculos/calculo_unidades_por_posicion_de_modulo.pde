class CalculoUnidadesPorPosicionDeModulo {
	int unidades=1;
	private float baseMultiplicadora;
	
	
	public CalculoUnidadesPorPosicionDeModulo(int posicion, float baseMultiplicadora) {
		this.baseMultiplicadora = baseMultiplicadora;
		dameCantidadDeUnidadesPorPosicionDeModulo(posicion);
	}


	/**
	 * este metodo devuelva la cantidad de unidades de la escala segun la
	 * posicion o distancia desde la unidad o primer modulo
	 * 
	 * @param i
	 * @param unidades
	 * @return
	 */
	private int dameCantidadDeUnidadesPorPosicionDeModulo(int i) {
		while (i > 0) {
			unidades *= baseMultiplicadora;
			i--;
			return dameCantidadDeUnidadesPorPosicionDeModulo(i);
		}
		return unidades;
	}
}
