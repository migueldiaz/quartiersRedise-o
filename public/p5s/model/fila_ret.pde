class FilaRet extends ElementoReticulaAbstract implements TieneMedidaVariableAnterior{

	 ReticulaRet reticulaRet;

	public FilaRet(FilaRet anterior, ReticulaRet reticulaRet) {
		this.anterior = anterior;
		this.reticulaRet = reticulaRet;
	}

	public float getWidth() {
		return reticulaRet.getWidth();
	}

	public float getHeightFinal() {
		return getMedidaVariableFinal();
	}

	public float getHeight() {
		return getMedidaVariable();
	}

	public float getX() {
		return reticulaRet.getX();
	}

	public float getY() {
		return reticulaRet.getY()+getPosicionEnRelacionDeSumasPosicionesAnteriores();
	}

	public void setColumnas(List columnas) {
		elementos=columnas;
	}

	public List<ColRet> getColumnas() {
		List o=elementos;
		return o;
	}

	public int getPosicion() {
		return reticulaRet.filas.indexOf(this);
	}


}
