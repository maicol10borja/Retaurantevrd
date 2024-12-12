<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="models.*" %>
<%
    Carro carro = (Carro) session.getAttribute("carro");
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carro de Compras</title>
</head>
<body>

<div class="container mt-5">
    <h1>Carro de Compras</h1>

    <%
        if (carro == null || carro.getItems().isEmpty()) {
    %>
    <div class="alert alert-warning text-center">
        <i class="fas fa-shopping-cart"></i> Lo sentimos, no hay productos en el carro de compras.
    </div>
    <%
    } else {
    %>
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3><i class="fas fa-shopping-cart"></i> Detalles del Carro</h3>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                <tr>
                    <th>ID Producto</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (ItemCarro item : carro.getItems()) {
                %>
                <tr>
                    <td><%= item.getProductos().getIdProducto() %></td>
                    <td><%= item.getProductos().getNombre() %></td>
                    <td>$<%= item.getProductos().getPrecio() %></td>
                    <td><%= item.getCantidad() %></td>
                    <td>$<%= item.getSbtotal() %></td>
                </tr>
                <% } %>
                <tr class="table-info">
                    <td colspan="4" style="text-align: right; font-weight: bold;">Total</td>
                    <td>$<%= carro.getTotal() %></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <%
        }
    %>

    <!-- Enlaces para seguir comprando o ir al inicio -->
    <div class="footer-links text-center mt-4">
        <p><a href="<%= request.getContextPath() %>/productos" class="btn btn-primary">Seguir Comprando</a></p>
        <p><a href="<%= request.getContextPath() %>/index.html" class="btn btn-secondary">Ir al Inicio</a></p>
    </div>

</div>

</body>
</html>
