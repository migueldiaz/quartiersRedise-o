class Refresco {
	int limite=30;
	int pasos=limite;

	
	public void display(){
		if(pasos<limite){
			pushStyle();
			fill(0, map(pasos, 0,limite, 100,0));
			rect(10,10,50,50);
			popStyle();
			pasos++;
		}
	}
	
	public void reset(){
		pasos=0;
	}
	
	

}