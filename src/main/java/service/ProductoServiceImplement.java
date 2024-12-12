package service;

import models.Categoria;
import models.Productos;
import service.ProductoService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductoServiceImplement implements ProductoService {
    private final List<Productos> productos = new ArrayList<>(List.of(
            new Productos(1L, "Laptop", "tecnología", 523.25),
            new Productos(2L, "Cocina", "hogar", 325.24),
            new Productos(3L, "Mouse", "tecnología", 15.25)
    ));

    @Override
    public List<Productos> listar() {
        return productos; // Devuelve la lista persistente
    }

    @Override
    public Optional<Productos> agregarPorId(Long idProducto) {
        return productos.stream().filter(p -> p.getIdProducto().equals(idProducto)).findAny();
    }

    @Override
    public void guarda(Productos producto) {

    }

    @Override
    public void eliminar(Long id) {

    }

    @Override
    public List<Categoria> listarCategoria() {
        return List.of();
    }

    @Override
    public Optional<Categoria> porIdCategoria(Long idCategoria) {
        return Optional.empty();
    }
}

