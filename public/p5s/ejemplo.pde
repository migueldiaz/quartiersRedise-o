	RectangleConTexto rectangleConTexto;
Log log=new Log();

void setup() {
  size(800, 600);
  smooth(); 
  		String mensaje = "me pareci&#243; muy interesante tu comentario acerca de la juventud.... al final del mismo preguntabas lo";
		int anchoRectangle = 100;
		int altoRectangle = 100;
		float posXRectangle = 100;
		float posYRectangle = 100;
	 rectangleConTexto = new RectangleConTexto( mensaje, posXRectangle, posYRectangle,anchoRectangle, altoRectangle);
}

void draw() {
 	
		  background(255);
		
		fill(0);
		rectangleConTexto.display(true);
}
	int incremento = 5;

	public void keyPressed() {
		if (keyCode == BACKSPACE) {
		

		} else if (keyCode == UP) {
			log.debug("UP!");
			rectangleConTexto.ampliaAncho(incremento);
			rectangleConTexto.ampliaAlto(incremento);
		} else if (keyCode == DOWN) {
			log.debug("DOWN");
			rectangleConTexto.reduceAncho(incremento);
			rectangleConTexto.reduceAlto(incremento);

		} else if (keyCode == LEFT) {
			log.debug("LEFT");
		} else if (keyCode == RIGHT) {
			log.debug("RIGHT");

		}
	}
