class RedimensionadorPosicionadorElementos {

	// 1=1
	// 2=1+2=3
	// 3=1+2+4=7
	// 4=1+2+4+8=15
	// 5=1+2+4+8+16=31

	private void recalculaPosiciones(CeldaRet celdaSeleccionada, List elementos, List<MarcaPosicion> marcas) {
		for (int i = 0; i < marcas.size() - 1; i++) {
			MarcaPosicion marcaActual = marcas.get(i);
			MarcaPosicion marcaSig = marcas.get(i + 1);
			float anchoInicial = marcaSig.marca - marcaActual.marca;
			((TieneMedidaVariableAnterior) elementos.get(i)).setMedidaVariable(anchoInicial);
		}
	}

	public void recursivoDescNormaliza(CeldaRet celda) {
		float alto = celda.getParent().getHeightFinal() / celda.getParent().getChildren().size();
		for (CeldaRet c : celda.getParent().getChildren()) {
			c.setMedidaVariable(alto);
		}
		for (CeldaRet child : celda.getChildren())
			recursivoDescNormaliza(child);
	}

	/**
	 * falla el calculo recursivo por cada celda hija llama al recalculo de
	 * todas las celdas hijas de parent
	 */
	public void recursivoDesc(CeldaRet celda, CeldaRet celdaSeleccionada) {
		ResultadoBuscaSeldaSeleccionadaDeChildren resBusqCeldaChildrenSel = buscaCeldaSeleccionadaDeChildren(celda,
				celdaSeleccionada);
		int indice = resBusqCeldaChildrenSel.indice;
		List<MarcaPosicion> marcas;
		if (resBusqCeldaChildrenSel.resultado == false) {
//			CalculoMarcas calculoMarcas = new CalculoMarcas(celda.getParent().getHeightFinal(), celda.getParent()
//					.getChildren().size(), indice, 2);
			int porcentaje=60;
			if(celda.getParent().getChildren().size()==1) porcentaje=100;

			marcas = aumentaVisibilidad(indice, celda.getParent().getChildren().size(), celda.getParent()
					.getHeightFinal(), porcentaje);

//			marcas = calculoMarcas.marcas;
		} else {
			log.info("aumentando visibilidad celda:"+celda.getColumna().getFila().getPosicion()+"-"+celda.getColumna().getPosicion()+"-"+celda.getPosicion());
			int porcentaje=90;
			if(celda.getParent().getChildren().size()==1) porcentaje=100;
			int pos=celda.getPosicion();
			for(CeldaRet c:celda.getCeldaParent().getChildren())
				if(esLineaSeleccionada(c,celdaSeleccionada))
					pos=c.getPosicion();
			marcas = aumentaVisibilidad(pos, celda.getParent().getChildren().size(), celda.getParent()
					.getHeightFinal(), porcentaje);
		}

		recalculaPosiciones(celdaSeleccionada, celda.getParent().getChildren(), marcas);

		for (CeldaRet child : celda.getChildren())
			recursivoDesc(child, celdaSeleccionada);
	}

	private ResultadoBuscaSeldaSeleccionadaDeChildren buscaCeldaSeleccionadaDeChildren(CeldaRet celda,
			CeldaRet celdaSeleccionada) {
		for (CeldaRet c : celda.getParent().getChildren())
			if (esLineaSeleccionada(c, celdaSeleccionada)) {
				int indexOf = celda.getParent().getChildren().indexOf(c);
				boolean resultado = true;
				if (c.equals(celdaSeleccionada))
					resultado = false;
				return new ResultadoBuscaSeldaSeleccionadaDeChildren(indexOf, resultado);
			}
		return new ResultadoBuscaSeldaSeleccionadaDeChildren(0, false);
	}

	public boolean esLineaSeleccionada(CeldaRet celda, CeldaRet celdaSeleccionada) {
		log.debug(celda.comentario);
		CalculoChildrenSel calculoChildrenSel = new CalculoChildrenSel(celda, celdaSeleccionada);
		return calculoChildrenSel.esLinea;
	}

	public void recalculaPosicionesColumnas(CeldaRet celdaSeleccionada, int i, List<ColRet> columnas, float ancho) {
		//CalculoMarcas calculoMarcas = new CalculoMarcas(ancho, columnas.size(), i, 2);
		// recalculaPosiciones(celdaSeleccionada, columnas,
		// calculoMarcas.marcas);
		log.info("col.size:"+columnas.size());
		log.info("celdaSeleccionada.getColumna():"+celdaSeleccionada.getColumna().getPosicion());
		log.info("ancho:"+ancho);
		List<MarcaPosicion> res = aumentaVisibilidad(celdaSeleccionada.getColumna().getPosicion(), columnas.size(), ancho, 65);
		recalculaPosiciones(celdaSeleccionada, columnas,res);

	}

	public void recalculaPosicionesFilas(CeldaRet celdaSeleccionada, int i, List<FilaRet> filas, float alto) {
		List<MarcaPosicion> marcas = null;
		int porcentaje = 60;
		int sizeFilas = filas.size();
		// if (celdaSeleccionada.getColumna().getPosicion() > 0) {
		int posicionFila = celdaSeleccionada.getColumna().getFila().getPosicion();
		marcas = aumentaVisibilidad(posicionFila, sizeFilas, alto, damePorcentajeAlturaFilaSegunDistanciaColumnaSeleccionada(celdaSeleccionada));
		// } else {
		// CalculoMarcas calculoMarcas = new CalculoMarcas(alto, sizeFilas, i,
		// 2);
		// marcas = calculoMarcas.marcas;
		// }
		log.debug(marcas.size() + " --- " + marcas);
		recalculaPosiciones(celdaSeleccionada, filas, marcas);
	}

	private int damePorcentajeAlturaFilaSegunDistanciaColumnaSeleccionada(CeldaRet celdaSeleccionada) {
		int distanciaDeColumna0 = celdaSeleccionada.getColumna().getPosicion();
		if(distanciaDeColumna0==0)
			return 65;
		else if(distanciaDeColumna0==1)
			return 80;
		else
		return 98;
	}

	 public List<MarcaPosicion> aumentaVisibilidad(int posicion, int numeroElementos, float limite, int porcentaje) {
		List<MarcaPosicion> marcas = new ArrayList<MarcaPosicion>();

		float per_centaje = limite * porcentaje / 100;

		float per_cent_resto = limite - per_centaje;

		// int sizeFilas = filas.size();

		int restoPosiciones = numeroElementos - 1;

		float moduloResto = per_cent_resto / restoPosiciones;

		int numeroElementosUp = posicion;
		float alturaUp = moduloResto * numeroElementosUp;
		CalculoMarcas calculoMarcasUp = new CalculoMarcas(alturaUp, numeroElementosUp, numeroElementosUp - 1, 2);

		float ultimaMarcaUp = calculoMarcasUp.marcas.get(calculoMarcasUp.marcas.size() - 1).marca;
		marcas.addAll(calculoMarcasUp.marcas);
		MarcaPosicion seleccion = new MarcaPosicion(ultimaMarcaUp + per_centaje);
		marcas.add(seleccion);
		int numeroElementosDown = restoPosiciones - numeroElementosUp;
		log.debug("si!!" + numeroElementosDown + " numero el:" + numeroElementos + " posicion: " + posicion);
		CalculoMarcas calculoMarcasDown = new CalculoMarcas(moduloResto * (numeroElementosDown), numeroElementosDown,
				0, 2);
		for (int j = 1; j < calculoMarcasDown.marcas.size(); j++) {
			MarcaPosicion mp = calculoMarcasDown.marcas.get(j);
			marcas.add(new MarcaPosicion(mp.marca + seleccion.marca));
		}
		return marcas;
	}

	public void recalculaPosicionesFilasObj(CeldaRet celdaSeleccionada, FilaRet filaSeleccionada, List<FilaRet> filas,
			float height) {
						log.info("fila sel"+filaSeleccionada.getPosicion());
			
		recalculaPosicionesFilas(celdaSeleccionada, filas.indexOf(filaSeleccionada), filas, height);

	}

	public void recalculaPosicionesColumnasObj(CeldaRet celdaSeleccionada, ColRet columnaSeleccionada,
			List<ColRet> columnas, float width) {
			log.debug("llegandooo"+columnas.indexOf(columnaSeleccionada)+" ancho"+width);
		recalculaPosicionesColumnas(celdaSeleccionada, columnas.indexOf(columnaSeleccionada), columnas, width);
	}

}
