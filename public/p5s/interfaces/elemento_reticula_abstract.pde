class ElementoReticulaAbstract implements TieneMedidaVariableAnterior, Displayable{
	float medidaVariableAnterior;
	protected float medidaVariable;

	public void setMedidaVariable(float ancho) {
		if (medidaVariable != 0)
			medidaVariableAnterior = medidaVariable;
		else
			medidaVariableAnterior = ancho;
		this.medidaVariable = ancho;
		contador = 0;
	}

	int contador = 0;

	int pasos = 10;

	public float getMedidaVariableFinal() {
		return medidaVariable;
	}

	public float getMedidaVariable() {
		//TODO esto es diferente segun si se hace mas pequenyo o mas grande
	//	if(contador>=pasos) return medidaVariable;
		return map(contador, 0, pasos, medidaVariableAnterior, medidaVariable);
			
	}

	public void actualiza() {
		if (contador < pasos)
			contador++;
	}

	protected TieneMedidaVariableAnterior anterior;

	protected float getPosicionEnRelacionDeSumasPosicionesAnteriores() {
		CalculoRecursivo calculo = new CalculoRecursivo();
		float res = calculo.calcula(this);
		return res;
	}

	public TieneMedidaVariableAnterior getAnterior() {
		return anterior;
	}

	protected List<ElementoReticulaAbstract> elementos = new ArrayList<ElementoReticulaAbstract>();

}
