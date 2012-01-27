class ReticulaRet implements TreeDisplayable{
	float x1;
	float y1;
	float ancho;
	float alto;
	public List<ComentarioForo> mensajes;
	public List<FilaRet> filas;
	public List<Usuario> usuarios;
	public List<ComentarioForo> comentariosOrdenadosFecha;
	private List<CeldaRet> celdasPrimeraColumna = new ArrayList<CeldaRet>();
	RedimensionadorPosicionadorElementos redimensionadorPosicionadorElementos = new RedimensionadorPosicionadorElementos();
	boolean muestraTexto=false;
	CalculoProfundidadColumna cc;
	 CeldaRet celdaSeleccionada;
	List<ComentarioEscale> comentariosExistentesDB;

	 ServicioLoadEquipos servicioLoadEquipos;
	
	public ReticulaRet(String xml, float x1, float y1, float ancho, float alto){
		this.x1 = x1;
		this.y1 = y1;
		this.ancho = ancho;
		this.alto = alto;
		servicioLoadEquipos = new ServicioLoadEquipos();
		comentariosExistentesDB = servicioLoadEquipos.loadXML(xml);
		resetReticulaConComentariosDB(false);

	}
	
	private void resetReticulaConComentariosDB(boolean menos) {
		loadComentariosXML();

		cc = new CalculoProfundidadColumna(mensajes);
		log.info("profundidad: " + cc.columnas);

		generaFilasYColumnasVinculadasSinCeldasComentarios(cc);


		cargaCeldasComentarios();

		seleccionaPrimeraCeldaComentario();

		// calculo de posiciones
		calculaPosicionesTamanyosReticulaInicial(true);
	}
	
	public void incluyeXML(String xml, ComentarioEscale c){
		List<ComentarioForo> nuevos = servicioLoadEquipos.loadXML(xml);
		mensajes=new ArrayList<ComentarioForo>();
		for(ComentarioForo n:nuevos)
		comentariosExistentesDB.add(n);
		for(ComentarioForo cc:comentariosExistentesDB){
			cc.children=new ArrayList<ComentarioForo>();
		}
		resetReticulaConComentariosDB(true);
		selecciona(c);
		recalculaRet();
	}
	
	boolean normalizada;
	private void normalizaFilas() {
		float altura = alto / filas.size();
		for (FilaRet f : filas) {
			f.setMedidaVariable(altura);
		}
		normalizada=true;
	}
	
	
	private void calculaPosicionesTamanyosReticulaInicial(boolean normaliza) {
		// calcula dimension de filas marcanfo la fila 0 INICIAL DE RETICULA
		if (normaliza) {
			normalizaFilas();
		} else {
			redimensionadorPosicionadorElementos.recalculaPosicionesFilas(celdaSeleccionada, 0, filas, alto);
		}
float anchoColumna = getWidth() / cc.columnas;
	try {
		for (FilaRet f : filas) {
			// esto se hace dentro del bucle porque las columnas pertenecen
			// unicamente a una fila (cada iteracion del bucle)

			// la columna seleccionada es la misma para todas las filas
			// porque este metodo se ejecuta al iniciar la reticula y queremos
			// la columna=0
			redimensionadorPosicionadorElementos.recalculaPosicionesColumnasObj(celdaSeleccionada, 0, f.getColumnas(),f.getWidth());
			// calcula dimension de celdas de columnas de cada fila
			for (int j = 0; j < f.getColumnas().size(); j++) {
				ColRet columna = (ColRet) f.getColumnas().get(j);
				if (columna.getAnterior() == null) {
					/*
					 * asigna la altura de las celdas de la primera columna a la
					 * altura de fila perteneciente y calculada anteriormente
					 */
					for (CeldaRet c : columna.getCeldas())
						c.setMedidaVariable(c.getFila().getHeight());
				} else {
					/*
					 * calcula la altura de las celdas de las siguientes celdas
					 * de las siguientes columnas en funcion de columna/celda
					 * anterior y seleccionando la primera posicion de las
					 * celdas hijas
					 */
					ColRet cAnt = (ColRet) f.getColumnas().get(j - 1);
					for (int celI = 0; celI < cAnt.getCeldas().size(); celI++) {
						CeldaRet celdaInt = (CeldaRet) cAnt.getCeldas().get(celI);
						if (normaliza) {
							float altoI = celdaInt.getHeight() / celdaInt.getChildren().size();
							for (CeldaRet cii : celdaInt.getChildren())
								cii.setMedidaVariable(altoI);
						} else {
							redimensionadorPosicionadorElementos.recursivoDesc(celdaInt, celdaSeleccionada);

							// TODO:CHANGE!
							// redimensionadorPosicionadorElementos.recalculaPosicionesCeldas(celdaSeleccionada,
							// 0, celdaInt.getChildren(),
							// celdaInt.getHeight());
						}
					}
				}
			}
		}	
	} catch (ex){
		alert(ex);
	}
}



	private void seleccionaPrimeraCeldaComentario() {
		// activando el primer comentario!
		List<ColRet> columnas = filas.get(0).getColumnas();
		List<CeldaRet> celdas = columnas.get(0).getCeldas();
		celdaSeleccionada = (CeldaRet) celdas.get(0);
		// fin activar primer comentario
	}
	private void cargaCeldasComentarios() {
		for (int c = 0; c < mensajes.size(); c++) {
			ComentarioForo comentario = mensajes.get(c);

			int col = 0;
			FilaRet fila = filas.get(c);

			cargaColumna(comentario, col, fila);
		}

	}
	
	private void cargaColumna(ComentarioForo comentario, int col, FilaRet fila) {
		ColRet columna = (ColRet) fila.getColumnas().get(col);

		CeldaRet celdaAnterior = null;
		if (columna.getCeldas().size() > 0)
			celdaAnterior = (CeldaRet) columna.getCeldas().get(columna.getCeldas().size() - 1);
		CeldaRet celdaParent = null;
		if (comentario.comentarioParent != null) {
			celdaParent = buscaCelda(comentario.comentarioParent, col, fila);
		} else {
			// columna 0 celdaParent=null;
		}
		CeldaRet celdaNueva = new CeldaRet(celdaAnterior, celdaParent, columna, comentario, new RectangleConTexto( comentario.texto));
		columna.getCeldas().add(celdaNueva);
		if (col == 0)
			celdasPrimeraColumna.add(celdaNueva);

		for (ComentarioEscale child : comentario.children) {
			cargaColumna(child, col + 1, fila);
		}
	}
	private CeldaRet buscaCelda(ComentarioForo comentarioParent, int col, FilaRet fila) {
		ColRet kol = (ColRet) fila.getColumnas().get(col - 1);
		for (CeldaRet c : kol.getCeldas())
			if (c.comentario == comentarioParent)
				return c;
		throw("deberia existir un celda parent para" + comentarioParent);
	}
	private void generaFilasYColumnasVinculadasSinCeldasComentarios(CalculoProfundidadColumna cc) {
		filas = new ArrayList<FilaRet>();
		for (int i = 0; i < mensajes.size(); i++) {

			FilaRet filaAnterior = null;
			if (i > 0)
				filaAnterior = filas.get(i - 1);

			FilaRet filaActual = new FilaRet(filaAnterior, this);
			filas.add(filaActual);
			List columnas = new ArrayList<ColRet>();
			for (int j = 0; j < cc.columnas; j++) {

				ColRet columnaAnterior = null;
				if (j > 0)
					columnaAnterior = (ColRet) columnas.get(j - 1);

				ColRet columnaActual = new ColRet(columnaAnterior, filaActual);
				columnas.add(columnaActual);
			}

			filaActual.setColumnas(columnas);

			log.debug("numero de columnas:" + filaActual.getColumnas().size());

		}
	}
	
	
	private void loadComentariosXML(String xml) {
			 ServicioMensajes servicioMensajes= new ServicioMensajes();

		servicioMensajes.loadMensajes(comentariosExistentesDB);
		usuarios = servicioMensajes.usuarios;
		mensajes = servicioMensajes.organizaMensajes;
		log.info("mensajessize:" + mensajes.size());
		comentariosOrdenadosFecha = servicioMensajes.getComentariosOrdenadosFecha();
	
	}
	public float getX() {
		return x1;
	}

	public float getY() {
		return y1;
	}

	public float getWidth() {
		return ancho;
	}

	public float getHeight() {
		return alto;
	}
	
	
	public void display() {

		for (FilaRet fila : filas)
			pintaFila(fila);

	}
	
	
	private void pintaFila(FilaRet fila) {
		fila.actualiza();
		float filaX = getX();
		float filaY = fila.getY();
		float filaHeight = fila.getHeight();
		float filaWeight = getWidth();
		noStroke();
		// rect(filaX, filaY, filaWeight, filaHeight);
		for (ColRet col : fila.getColumnas()) {
			col.actualiza();
			float colX = col.getX();
			float colY = filaY;
			float colWeight = col.getWidth();
			float colHeight = col.getHeight();
			// fill(HelperColors.getColor(),80);
			fill(100);
			stroke(50);
			strokeWeight(0.5f);
			rect(colX, colY, colWeight, colHeight);

			for (CeldaRet celda : col.getCeldas()) {
				celda.actualiza();

				float celdaX = celda.getX();
				float celdaY = celda.getY();
				float celdaWeight = celda.getWidth();
				float celdaHeight = celda.getHeight();
				if (celda != celdaSeleccionada || (celda == celdaSeleccionada && normalizada)) {
					fill(celda.color);
					rect(celdaX, celdaY, celdaWeight, celdaHeight);
				} else {
					noStroke();
					fill(100);
					rect(celdaX, celdaY, celdaWeight, celdaHeight);
					fill(celda.color);
					rect(celdaX, celdaY, celdaWeight / 50, celdaHeight);
					rect(celdaX, celdaY, celdaWeight / 3, celdaHeight / 50);

					rect(celdaX + celdaWeight - celdaWeight / 50, celdaY, celdaWeight / 50, celdaHeight);
					rect(celdaX + celdaWeight - celdaWeight / 3, celdaY + celdaHeight - celdaHeight / 50,
							celdaWeight / 3, celdaHeight / 50);

				}
				fill(0);
				//|| celda==celdaSeleccionada ampliar condicion para que aparezca texto en celda seleccionada
				//(celda.getHeight()==celda.getHeightFinal()
				celda.rectangleConTexto.setMedidas(celda.getX(), celda.getY(), celda.getWidth(), celda.getHeight());
				celda.rectangleConTexto.display(false);
				// text(celda.comentario.usuario.nombre, celdaX, celdaY +
				// celdaHeight / 4);
				// text(celda.comentario.titulo, celdaX, celdaY + celdaHeight
				// / 2);
			}
		}
	}



	public void raton(int mouseX, int mouseY) {
		boolean encimaFila = false;
		for (FilaRet f : filas) {
			float y1 = f.getY();
			boolean coincideHor = mouseX > getX() && mouseX < (getX() + getWidth());
			boolean coindiceV = mouseY > y1 && mouseY < y1 + f.getMedidaVariable();
			encimaFila = coincideHor && coindiceV;
			if (encimaFila) {
				log.debug("over FILA CLCIK en fila" + f);
				for (ColRet kolumna : f.getColumnas()) {
					boolean encima = isOverColumna(mouseX, mouseY, (ColRet) kolumna);
					if (encima) {
						log.debug("OVER KOLumna click pos sel: " + kolumna);

						for (CeldaRet celda : kolumna.getCeldas()) {
							boolean encimaCelda = isOverCelda(mouseX, mouseY, (CeldaRet) celda);
							if (encimaCelda) {
								log.debug("OVER CELDA click pos sel: " + celda);
								seleccionaPrimeraCeldaSiHayDistancia(celdaSeleccionada, celda);
								//log.info("celda" + celda.comentario.texto);
								log.info("celda" + celda);
								recalculaRet();

								break;
							}
						}

					}
				}
				break;
			}
		}
	}
	
	
	private void recalculaRet() {
		recalculaRet(false);
	}

	private void recalculaRet(boolean normaliza) {
		ColRet columnaSeleccionada = celdaSeleccionada.getColumna();
		FilaRet filaSeleccionada = columnaSeleccionada.getFila();

		// recalcula la altura de las filas
		if (normaliza) {
			normalizaFilas();
		} else {
			redimensionadorPosicionadorElementos.recalculaPosicionesFilasObj(celdaSeleccionada, filaSeleccionada, filas,
					getHeight());
			this.normalizada = false;
		}
		// recalcula unicamente el ancho de las columnas de la fila
		// seleccionada
		redimensionadorPosicionadorElementos.recalculaPosicionesColumnasObj(celdaSeleccionada, columnaSeleccionada,
				filaSeleccionada.getColumnas(), getWidth());

		// TODO: solo recalculo de toda la reticula o reasignacion de toda la
		// reticula si hay cambio de fila
		/*
		 * recalcula la altura de las celdas de toda la reticula (esto se puede
		 * optimizar) ya que si no hay cambio de fila para que se va a recorrer
		 * toda la reticula
		 */
		// recalcula celdas parents (de primera columna)
		for (CeldaRet celdaPrimeraDeFila : getCeldasPrimeraColumna())
			celdaPrimeraDeFila.setMedidaVariable(celdaPrimeraDeFila.getFila().getHeightFinal());
		// recursivo desde la segunda columna (hijos de celdas de primera
		// columna)
		for (CeldaRet child : getCeldasPrimeraColumna())
			for (CeldaRet subChild : child.getChildren())
				if (normaliza)
					redimensionadorPosicionadorElementos.recursivoDescNormaliza(subChild);
				else
					redimensionadorPosicionadorElementos.recursivoDesc(subChild, celdaSeleccionada);

	}
	
	private boolean isOverColumna(int mouseX, int mouseY, ColRet kolumna) {
		float x1 = kolumna.getX();
		float y1 = kolumna.getY();

		boolean coincideHor = mouseX > x1 && mouseX < (x1 + kolumna.getWidth());
		boolean coindiceV = mouseY > y1 && mouseY < y1 + kolumna.getHeight();
		boolean encima = coincideHor && coindiceV;
		return encima;
	}
	private boolean isOverCelda(int mouseX, int mouseY, CeldaRet selda) {

		float x1 = selda.getX();
		float y1 = selda.getY();

		boolean coincideHor = mouseX > x1 && mouseX < (x1 + selda.getColumna().getWidth());
		boolean coindiceV = mouseY > y1 && mouseY < y1 + selda.getHeight();
		boolean encima = coincideHor && coindiceV;
		return encima;
	}
	
	private void seleccionaPrimeraCeldaSiHayDistancia(CeldaRet anterior, CeldaRet actual) {

		int posFilaAnterior = filas.indexOf(anterior.getColumna().getFila());
		FilaRet filaActual = actual.getColumna().getFila();
		int posFilaActual = filas.indexOf(filaActual);

		if (abs(posFilaAnterior - posFilaActual) > 1) {
			celdaSeleccionada = filaActual.getColumnas().get(0).getCeldas().get(0);
		} else {
			celdaSeleccionada = actual;
		}

	}
	public List<CeldaRet> getCeldasPrimeraColumna() {
		return celdasPrimeraColumna;
	}
	
	
	
	
	
		public void selectRIGHT() {
		if (celdaSeleccionada.getChildren().size() > 0) {
			log.debug("seleccion de comentario a la derecha");
			celdaSeleccionada = celdaSeleccionada.getChildren().get(0);
			recalculaRet();
		} else {
			if (celdaSeleccionada.getParent() == null) {
				FilaRet filaSel = celdaSeleccionada.getColumna().getFila();
				int posFila = filas.indexOf(filaSel);
				if (posFila < filas.size() - 1) {
					FilaRet filaAnterior = filas.get(posFila + 1);
					celdaSeleccionada = filaAnterior.getColumnas().get(0).getCeldas().get(0);
					recalculaRet();
				}
			} else {
				List<CeldaRet> brothers = celdaSeleccionada.getColumna().getCeldas();
				int posCelda = brothers.indexOf(celdaSeleccionada);
				if (posCelda < brothers.size() - 1) {
					celdaSeleccionada = brothers.get(posCelda + 1);
					recalculaRet();
				} else {
					// buscar parent sigu...
					CeldaRet sigParent = buscaSigParent(celdaSeleccionada);
					if (sigParent == null)
						seleccionaPrimeraCeldaDeSiguienteFila(celdaSeleccionada.getColumna().getFila());
					else {
						celdaSeleccionada = sigParent;
						recalculaRet();
					}
				}

			}
		}

	}

	private CeldaRet buscaSigParent(CeldaRet celdaSeleccionada2) {
		CeldaRet parent = (CeldaRet) celdaSeleccionada2.getParent();
		if (parent == null)
			return null;
		List<CeldaRet> children = parent.getChildren();
		int pos = children.indexOf(celdaSeleccionada2);
		if (pos < children.size() - 1) {
			return children.get(pos + 1);
		}
		return buscaSigParent(parent);
	}

	public void selectUP() {
		FilaRet filaActual = celdaSeleccionada.getColumna().getFila();
		TreeDisplayable parent = celdaSeleccionada.getParent();
		if (parent != null) {
			int pos = parent.getChildren().indexOf(celdaSeleccionada);
			if (pos > 0) {
				log.debug("seleccion de comentario arriba en coluna distinta de 0");
				celdaSeleccionada = parent.getChildren().get(pos - 1);
				recalculaRet();

			}
		} else {
			int pos = filas.indexOf(filaActual);
			if (pos > 0) {
				log.debug("seleccion de comentario arriba en coluna 0");
				FilaRet filaSiguiente = filas.get(pos - 1);
				celdaSeleccionada = filaSiguiente.getColumnas().get(0).getCeldas().get(0);
				recalculaRet();
			}
		}

	}

	public void selectDOWN() {
		FilaRet filaActual = celdaSeleccionada.getColumna().getFila();
		TreeDisplayable parent = celdaSeleccionada.getParent();
		if (parent != null) {
			int pos = parent.getChildren().indexOf(celdaSeleccionada);
			if (parent.getChildren().size() > (pos + 1)) {
				log.debug("seleccion de comentario abajo en coluna distinta de 0");
				celdaSeleccionada = parent.getChildren().get(pos + 1);
				recalculaRet();

			}
		} else {
			seleccionaPrimeraCeldaDeSiguienteFila(filaActual);

		}

	}

	private void seleccionaPrimeraCeldaDeSiguienteFila(FilaRet filaActual) {
		int pos = filas.indexOf(filaActual);
		if (filas.size() > (pos + 1)) {
			log.debug("seleccion de comentario abajo en coluna 0");
			FilaRet filaSiguiente = filas.get(pos + 1);
			celdaSeleccionada = filaSiguiente.getColumnas().get(0).getCeldas().get(0);
			recalculaRet();
		}
	}

	public void selectLEFT() {
		if (celdaSeleccionada.getParent() != null) {
			log.debug("seleccion de comentario a la izquierda");

			celdaSeleccionada = (CeldaRet) celdaSeleccionada.getParent();
			recalculaRet();
		} else {
			FilaRet filaSel = celdaSeleccionada.getColumna().getFila();
			int posFila = filas.indexOf(filaSel);
			if (posFila != 0) {
				FilaRet filaAnterior = filas.get(posFila - 1);
				celdaSeleccionada = filaAnterior.getColumnas().get(0).getCeldas().get(0);
				recalculaRet();
			}

		}
	}
	
	public void reset() {
		recalculaRet(true);
	}
	public void selecciona(ComentarioForo comentarioTimeSel) {
		buscada = null;
		for (CeldaRet c : celdasPrimeraColumna) {
			busca(c, comentarioTimeSel);
			if (buscada != null) {
				celdaSeleccionada = buscada;
			}
		}
		recalculaRet();

	}
	public void busca(CeldaRet celda, ComentarioForo c) {
		if (celda.comentario == c) {
			buscada = celda;
			return;
		} else
			for (CeldaRet cc : celda.childdren)
				busca(cc, c);

	}
	
}
