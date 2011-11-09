class Rectangulo {
	float x;
	float y;
	float widtho;
	float heighto;
	ComentarioForo comentario;
	Fila fila;
	int contador;
	 int framesPorComentario;
	
	public Rectangulo(float x, float y, float _width, float _height, ComentarioForo comentario, int frm) {
		this.x = x;
		this.y = y;
		this.widtho = _width;
		this.heighto = _height;
		this.comentario = comentario;
				framesPorComentario = frm;
		
	}
 	public boolean isPintando() {
		return contador < framesPorComentario;
	}
 
}
