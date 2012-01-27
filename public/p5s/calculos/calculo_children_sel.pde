class  CalculoChildrenSel {
	
	public boolean esLinea;
	private final CeldaRet inicial;

	public CalculoChildrenSel(CeldaRet celdaCalculo, CeldaRet inicial) {
		this.inicial = inicial;
		localizaChildren(celdaCalculo);
	}

	private void localizaChildren(CeldaRet celdaCalculo) {
		if(celdaCalculo==inicial){
			esLinea=true;
			return;
		}else {
			for(CeldaRet c:celdaCalculo.getChildren())
			localizaChildren(c);
		}
	}
	

	
}
