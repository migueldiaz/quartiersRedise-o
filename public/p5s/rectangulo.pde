class Rectangulo {
	float xo;
	float yo;
	float widtho;
	float heighto;
	String nombre;
	int valor;
	public Rectangulo(String n) {
	this.nombre=n;
	this.valor=random(100);
	}
	public Rectangulo(float _x, float _y) {
		xo = _x;
		yo = _y;
		widtho = 100;
		heighto = 100;
		println("crando rect!"+xo+""+yo+""+widtho+""+heighto);
		
	}
 
 	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;

		if (nombre == null) {
			if (obj.nombre != null)
				return false;
		} else if (!nombre.equals(obj.nombre))
			return false;
		return true;
	}
	
	public String toString(){
		return "desde metodoToString::"+nombre+" valor"+valor;
		
	}
}
