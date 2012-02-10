class  CeldaRet extends ElementoReticulaAbstract implements TieneMedidaVariableAnterior,  Displayable {
	public ColRet columna;
	public  int color;
	RectangleConTexto rectangleConTexto;
	

	public  Displayable parent;
	public  CeldaRet childrenSel;
	public List<CeldaRet> childdren=new ArrayList<CeldaRet>();
	public  ComentarioEscale comentario;
	public CeldaRet(CeldaRet anterior, CeldaRet parent, ColRet kolumna){
		this(anterior, parent,kolumna,null,null);
	}
	public CeldaRet(CeldaRet anterior, CeldaRet parent, ColRet kolumna, ComentarioForo comentario, RectangleConTexto rect) {
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
		float valor=parent.getY()+getPosicionEnRelacionDeSumasPosicionesAnteriores();
	//		if(anterior!=null) valor-=anterior.getHeight();
		return valor;
		
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
		int pos=getParent().getChildren().indexOf(this);
		//println(pos);
			return pos;
		}
		return 0;
	}
	
	
	

}
