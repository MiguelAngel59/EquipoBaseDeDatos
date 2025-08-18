package practica01;

import java.awt.*;
import java.util.List;
import javax.swing.*;

public class VentanaPrincipal extends JFrame {

    private JButton btnMostrarVuelos;
    private JButton btnPromedio;
    private JTextArea areaTexto;
    private LectorArchivoDeTextoTabla lector;
    private String[] tablaLeida;

    public VentanaPrincipal() {
        setTitle("Gestor de Vuelos");
        setSize(500, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        lector = new LectorArchivoDeTextoTabla("vuelos.txt");
        tablaLeida = lector.leeArchivo();

        JPanel panelBotones = new JPanel();
        btnMostrarVuelos = new JButton("Mostrar Vuelos CDMX");
        btnPromedio = new JButton("Calcular Promedio");
        panelBotones.add(btnMostrarVuelos);
        panelBotones.add(btnPromedio);
        add(panelBotones, BorderLayout.NORTH);

        areaTexto = new JTextArea();
        areaTexto.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(areaTexto);
        add(scrollPane, BorderLayout.CENTER);

        btnMostrarVuelos.addActionListener(e -> mostrarVuelosCDMX());
        btnPromedio.addActionListener(e -> mostrarPromedio());
    }

    private void mostrarVuelosCDMX() {
        List<String> vuelos = lector.consultarConWhere(tablaLeida, 2, "Ciudad de Mexico");
        areaTexto.setText("Vuelos desde Ciudad de Mexico:\n--------------------------------\n");
        for (String vuelo : vuelos) {
            areaTexto.append(vuelo + "\n");
        }
        areaTexto.append("--------------------------------\n");
    }

    private void mostrarPromedio() {
        List<String> duraciones = lector.consultaSimpleSelect(tablaLeida, 6);
        double suma = 0;
        int contador = 0;
        for (String duracion : duraciones) {
            try {
                suma += Integer.parseInt(duracion.trim());
                contador++;
            } catch (NumberFormatException e) { }
        }
        double promedio = suma / contador;
        areaTexto.append("\nPromedio de duración de vuelos: " + promedio + " minutos\n");
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new VentanaPrincipal().setVisible(true));
    }
}
