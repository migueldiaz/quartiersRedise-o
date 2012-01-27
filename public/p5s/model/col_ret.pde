class ColRet extends ElementoReticulaAbstract implements TieneMedidaVariableAnterior {
	private FilaRet fila;

	public ColRet(ColRet anterior, FilaRet fila) {
		this.anterior = anterior;
		this.fila = fila;

	}


	public FilaRet getFila() {
		return fila;
	}


	public float getWidth(){
		return getMedidaVariable();
		
	}
		public float getWidthFinal(){
		return medidaVariable;
		
	}
	
	public float getHeight(){
		return fila.getHeight();
	}

	public float getHeightFinal(){
		return fila.getHeightFinal();
	}

	public float getX() {
		return fila.getX()+getPosicionEnRelacionDeSumasPosicionesAnteriores();
	}

	public float getY() {
		return fila.getY();
	}


	public List<CeldaRet> getCeldas(){
		List celdas=elementos;
		return celdas;
	}
	
	public int getPosicion(){
		return fila.getColumnas().indexOf(this);
	}

}
