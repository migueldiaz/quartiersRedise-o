class EquipoMini {
	int id;
	String nombre;
	color col;
	float cx;
	float cy;
	
	public EquipoMini(int id, String nombre, float _x, float _y){
		this.id=id;
		this.nombre=nombre;
		this.cx=_x;
		this.cy=_y;
	}
	
	
 	public void setColor(toxi.color.TColor tColor) {
		col = color(mapeaValor(tColor.hue()), mapeaValor(tColor.saturation()),
				mapeaValor(tColor.brightness()));
	}
 	protected float mapeaValor(float ta) {
	return map(ta, 0, 1, 0, 100);
	}
 
}
