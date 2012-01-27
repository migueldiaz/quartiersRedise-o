class CalculoRecursivo {
	float res;
	TieneMedidaVariableAnterior anterior;

	public float calcula(TieneMedidaVariableAnterior celdaRet) {
		anterior = celdaRet.getAnterior();
		sumaParent();
		return res;
	}

	private void sumaParent() {
		if (anterior != null) {
			res += anterior.getMedidaVariable();
			anterior = anterior.getAnterior();
			sumaParent();
		}

	}
}
