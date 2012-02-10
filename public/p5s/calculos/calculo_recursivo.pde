class CalculoRecursivo {
	float res;
	TieneMedidaVariableAnterior anterior;
	TieneMedidaVariableAnterior parent;
	public float calcula(TieneMedidaVariableAnterior celdaRet) {
		anterior = celdaRet.getAnterior();
		parent=celdaRet.parent;
		sumaAnterior();
		return res;
	}

	private void sumaAnterior() {
		if (anterior != null && anterior.parent==parent) {
			res += anterior.getMedidaVariable();
			anterior = anterior.getAnterior();
			sumaAnterior();
		}

	}
}
