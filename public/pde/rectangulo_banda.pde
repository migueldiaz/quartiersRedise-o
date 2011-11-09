class RectanguloBanda extends Rectangulo{

		public RectanguloBanda( float x, float y, float _width, float _height, ComentarioForo comentario, int fr) {
		super(x, y, _width, _height, comentario, fr);
		}

	float angle=0;
		public void pinta() {
			contador++;
			angle+=PI/framesPorComentario;
			fill(comentario.usuario.equipo.col,70);
			int v=framesPorComentario/2;
			float vx=x/2;
			float widthDyna=map(v + v*sin(angle), v,2*v, widtho,width);
			float xDyna=map(vx + vx*sin(angle), vx,2*vx, x,0);
			if(x!=0)
			rect(xDyna, y, widthDyna, heighto);
			else
				rect(x, y, widthDyna, heighto);
				
		}
 
}
