class Reset {
	int origen_x=10;
	int separacion=20;
	int origen_y=5;


	public void display() {

	

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
