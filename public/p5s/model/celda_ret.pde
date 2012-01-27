class  CeldaRet extends ElementoReticulaAbstract implements TieneMedidaVariableAnterior,  TreeDisplayable {
	public ColRet columna;
	public  int color;
	RectangleConTexto rectangleConTexto;
	

	public  TreeDisplayable parent;
	public  CeldaRet childrenSel;
	public List<CeldaRet> childdren=new ArrayList<CeldaRet>();
	public  ComentarioEscale comentario;
	public CeldaRet(CeldaRet anterior, CeldaRet parent, ColRet kolumna){
		this(anterior, parent,kolumna,null,null);
	}
	public CeldaRet(CeldaRet anterior, CeldaRet parent, ColRet kolumna, ComentarioEscale comentario, RectangleConTexto rect) {
		this.anterior = anterior;
		this.parent = parent;
		this.comentario = comentario;
		if(parent!=null)
		parent.childdren.add(this);
		this.columna = kolumna;
		this.color = comentario.usuario.equipo.col;
		 rectangleConTexto = rect;

	}

	public void setMedidaVariable(float ancho) {
		super.setMedidaVariable(ancho);
	
	}
	public float getHeight() {
		return getMedidaVariable();
	}
	public float getHeightFinal() {
		return medidaVariable;
	}

	public float getWidth() {
		return columna.getWidth();
	}
	public float getWidthFinal() {
		return columna.getWidthFinal();
	}

	public float getX() {
		return columna.getX();
	}

	public float getY() {
		if(parent==null)
		return columna.getY()+getPosicionEnRelacionDeSumasPosicionesAnteriores();
		return parent.getY()+getPosicionEnRelacionDeSumasPosicionesAnteriores();
		
	}

	public List<CeldaRet> getChildren() {
		return childdren;
	}

	public TreeDisplayable getParent() {
		return (TreeDisplayable) parent;
	}
	public CeldaRet getCeldaParent() {
		return  (CeldaRet) parent;
	}
	public String toString() {
		return "CeldaRet [comentario=" + comentario + "]";
	}
	public ColRet getColumna() {
		return columna;
	}
	public FilaRet getFila() {
		return getColumna().getFila();
	}
	public int getPosicion() {
		if(getParent()!=null){
			return getParent().getChildren().indexOf(this);
		}
		return 0;
	}
	
	
	

}
