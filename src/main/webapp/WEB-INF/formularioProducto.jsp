<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, models.*" %>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Productos productos = (Productos) request.getAttribute("productos");
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingreso de Productos</title>

</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <!-- Formulario de Ingreso de Producto -->
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h3 class="text-center"><i class="fas fa-box"></i> Ingreso de Producto</h3>
                </div>
                <div class="card-body">
                    <form action="<%=request.getContextPath()%>/productos/form" method="post" onsubmit="return validateForm()">
                        <!-- Campo Nombre del Producto -->
                        <div class="form-group">
                            <label for="nombre">Ingrese el nombre del producto:</label>
                            <input type="hidden" name="idProducto" value="<%=productos.getIdProducto()%>">
                            <input type="text" id="nombre" name="nombre" class="form-control" value="<%=productos.getNombre() != null ? productos.getNombre() : "" %>"
                                   pattern="^[A-Za-z\s]+$" title="El nombre solo puede contener letras y espacios" required>
                        </div>

                        <!-- Campo Categoría -->
                        <div class="form-group">
                            <label for="categoria">Seleccione la categoría:</label>
                            <select name="categoria" id="categoria" class="form-control" required>
                                <option value="">---Seleccione una Categoría---</option>
                                <% for (Categoria c : categorias) { %>
                                <option value="<%=c.getIdCategoria()%>" <%= c.getIdCategoria().equals(productos.getCategoria().getIdCategoria()) ? "selected" : "" %>><%= c.getNombre() %></option>
                                <% } %>
                            </select>
                        </div>

                        <!-- Campo Precio -->
                        <div class="form-group">
                            <label for="precio">Ingrese el precio:</label>
                            <input type="number" name="precio" id="precio" class="form-control" step="0.01" min="0" value="<%= productos.getPrecio() != 0 ? productos.getPrecio() : "" %>" required>
                        </div>

                        <!-- Botón Enviar -->
                        <div class="form-group text-center">
                            <input type="submit" value="Enviar" class="btn btn-primary btn-block py-2">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        var nombre = document.getElementById("nombre").value;
        var precio = document.getElementById("precio").value;

        // Validación para el campo "nombre" - asegurarse que no tenga números
        var nombrePattern = /^[A-Za-z\s]+$/;
        if (!nombrePattern.test(nombre)) {
            alert("El nombre no puede contener números.");
            return false;
        }

        // Validación para el campo "precio" - asegurarse que no sea negativo
        if (precio < 0) {
            alert("El precio no puede ser negativo.");
            return false;
        }

        return true; // Si pasa ambas validaciones, el formulario se envía
    }
</script>


</body>
</html>
