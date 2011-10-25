void setup(){
background(0);
size(300, 300);
fill(255);
rect(100, 100, 100, 100);
fuente=createFont("Arial", 20, true);
}

String encoding;
void llamada(data, resposeText){
	int numeroForos=data.length;
	
	

	for(int i=0; i<data.length; i++){
		println('data:'+data[i].foro.titulofr);
	}         
}



void mousePressed(){

var jsonRequest = new Request.JSON({url: 'http://localhost:3000/foros.json?id=2', method: 'get',onSuccess: function(responseJSON, responseText) {
llamada(responseJSON);
} }).send();

background(0);
}

void draw(){
}

void pintaRectRojo(){
fill(255, 0,0);
rect(50,50,50,50);
println("ole");
}