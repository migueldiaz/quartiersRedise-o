class RectangleConTexto {
		private  String mensaje;

		private  float posXRectangle;

		private  float posYRectangle;

		private float anchoRectangle;

		private float altoRectangle;
		int margen = 10;

		int margenAlto = margen;
		int margenAncho = margen;
		float posYLetter;
		float posXLetter;

		public RectangleConTexto( String mensaje, float posXRectangle, float posYRectangle, int anchoRectangle,
				int altoRectangle) {
			this.mensaje = mensaje;
			this.posXRectangle = posXRectangle;
			this.posYRectangle = posYRectangle;
			this.anchoRectangle = anchoRectangle;
			this.altoRectangle = altoRectangle;
			posYLetter = posYRectangle;
			posXLetter = posXRectangle;
		}

		public RectangleConTexto(String texto) {
			mensaje = texto;
		}

		public void reduceAlto(int incremento) {
			altoRectangle -= incremento;
			
		}

		public void reduceAncho(int incremento) {
			anchoRectangle -= incremento;
			
		}

		public void ampliaAlto(int incremento) {
			altoRectangle += incremento;
			
		}

		public void ampliaAncho(int incremento) {
			anchoRectangle += incremento;
			
		}

		public void display(boolean contorno){
			if(contorno){
			pushStyle();
			stroke(0);
			strokeWeight(3);
			fill(100);
			rect(posXRectangle, posYRectangle, anchoRectangle, altoRectangle);
			popStyle();
			}
			float limite=altoRectangle;
			if(anchoRectangle<altoRectangle) limite=anchoRectangle;
			//float size = map(limite, 0, 150, 7, 15);
			//textSize(size);
			//	textMode(SCREEN);
			
			//float transparenciaDown = map(altoRectangle, 0, 150, 50, 100);
			log.debug(mensaje);
			float margen=20;
			//println(anchoRectangle);
			text(mensaje, posXRectangle+margen, posYRectangle+margen, anchoRectangle-(margen*2), (altoRectangle-margen)-5);
			// desactivado el recuento de letras y calculo de ancho ... consume mucho procesador
			
		}
		private void resetBoth() {
			resetX();
			resetY();
		}

		private void resetX() {
			posXLetter = posXRectangle;
		}

		private void resetY() {
			posYLetter = posYRectangle;
		}

		public void setMedidas(float _x, float _y, float widtho, float heighto) {
			posXRectangle = _x;
			posYRectangle = _y;
			anchoRectangle = widtho;
			altoRectangle = heighto;
			
		}
	}

