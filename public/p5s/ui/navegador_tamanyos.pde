class NavegadorTamanyos {
	int origen_x=10;
	int separacion=20;
	int origen_y=5;


	public void display() {
	pushStyle();
	fill(100);
	stroke(0);
	strokeWeight(1);
	rect(origen_x,origen_y,separacion,separacion);
	noFill();
	rect(origen_x+separacion,origen_y,separacion,separacion);
	fill(0);
	text("r", separacion,separacion);
	text("R", separacion+separacion-2,separacion);
	popStyle();
	}
	int noClick=0;
	int menor=1;
	int mayor=2;
	
	public int  mouseClick(int mouseX, int mouseY) {
		boolean dentroY=(mouseY>=origen_y && mouseY<=origen_y+separacion);
		if(dentroY && mouseX>=origen_x && mouseX<=origen_x+separacion )
		return menor;
		else if(dentroY && mouseX>=origen_x+separacion && mouseX<=origen_x+separacion*2 )
		return mayor;
		
		return noClick;
	}


}
