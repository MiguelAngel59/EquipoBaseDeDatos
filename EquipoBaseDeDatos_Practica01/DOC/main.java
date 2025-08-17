package practica01;

import java.util.List;

public class main {

	public static void main(String[] args) {
		
		
		String ubicacionArchivo = "C:\\Users\\ST\\Documents\\Curso Java\\LecturaVuelos\\src\\vuelos.txt";
		
		LectorArchivoDeTextoTabla miLector = new LectorArchivoDeTextoTabla(ubicacionArchivo);
		
		String tablaLeida[] = miLector.leeArchivo();
		
		
		
		//Consulta where origen (indice de columna: 2) = Ciudad de Mexico (tercer parametro) 
		List<String> consultaWhereDestinoCDMX = miLector.consultarConWhere(tablaLeida, 2, "Ciudad de Mexico");
		
		for (String vuelosACDMX :consultaWhereDestinoCDMX) {
			System.out.println(vuelosACDMX);
		}
		
		
		
		
		//Parte de calculo de promedio de tiempos de vuelo
		double sumaDeTiempos=0;
		int numeroDeVuelos=0;
		List<String> consultaSelectDuracion = miLector.consultaSimpleSelect(tablaLeida, 6);
		
		for (String duracion :consultaSelectDuracion) {
			numeroDeVuelos++;
			int valorDuracion = Integer.parseInt(duracion.trim());
			System.out.println(valorDuracion);
			sumaDeTiempos+=valorDuracion;
		}
		double promedio = sumaDeTiempos/numeroDeVuelos;
		
		System.out.println("\nEl promedio de tiempos de vuelo es:" + promedio + " minutos");
		
		

	}

}
