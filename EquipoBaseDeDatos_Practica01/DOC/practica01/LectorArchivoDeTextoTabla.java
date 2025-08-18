package practica01;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Clase encargada de leer archivos de texto plano con formato tipo tabla.
 * El formato es con renglones separados por '\n' y columnas con ','.
 * Contiene una operacion reducida de consulta similar al where.
 */
public class LectorArchivoDeTextoTabla {
	private FileReader entrada;
	
	
	/**
     * Constructor que inicializa el lector de archivos con la ruta especificada.
     * @param ubicacionArchivo Ruta del archivo de texto a leer.
     */
	public LectorArchivoDeTextoTabla (String ubicacionArchivo){
		try {
			entrada = new FileReader(ubicacionArchivo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
    /**
     * Lee el archivo de texto y lo pasa a un String.
     * El string se corta ante cada ('\n') y se guarda en un arreglo.
     * @return Un arreglo de Strings, donde cada elemento representa un renglon del archivo.
     */
	public String[] leeArchivo() {
		String[] renglonesTabla;
		String renglonesLeidos = "";
		
		int temp;
		try {
			temp = entrada.read();
			while (temp!=-1) {
				renglonesLeidos += (char)temp;
				temp = entrada.read();
			}
			entrada.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		renglonesTabla = renglonesLeidos.split("\n");
		return renglonesTabla;
	}
	
	
    /**
     * Realiza una consulta tipo {@code WHERE} sobre el contenido de un archivo previamente leído.
     * La numeración de columnas comienza en 1 (no en 0), por lo que {@code numeroColumna = 1} representa la primera columna.
     *
     * @param archivoLeido              Arreglo de renglones del archivo, resultado de aplicar leeArchivo. Puede ser nuestro "from";
     * @param numeroColumna             Número de la columna (comenzando en 1) que se desea consultar y aplicar el where.
     * @param valorDeColumnaBuscado     Valor del criterio de busqueda del where.
     * @return Una lista de renglones que cumplen con la condición de igualdad en la columna indicada.
     */
	public List<String> consultarConWhere (String[] archivoLeido, int numeroColumna, String valorDeColumnaBuscado) {
		List<String> resultadoConsulta = new ArrayList<>();
		for (String renglon : archivoLeido) {
			String[] columnas = renglon.split(",");
			String columnaConsultada = columnas[numeroColumna-1];
			if (columnaConsultada.equals(valorDeColumnaBuscado)) {
				resultadoConsulta.add(renglon);
			}
		}
		return resultadoConsulta ;
	}
	
	public List<String> consultaSimpleSelect (String[] archivoLeido, int numeroColumna) {
		List<String> resultadoConsulta = new ArrayList<>();
		for (String renglon : archivoLeido) {
			String[] columnas = renglon.split(",");
			String columnaConsultada = columnas[numeroColumna-1];
			resultadoConsulta.add(columnaConsultada);
		}
		return resultadoConsulta ;
	}
	
	
	
	
	
	

}
