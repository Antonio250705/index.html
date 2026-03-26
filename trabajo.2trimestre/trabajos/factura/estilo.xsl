<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <style>
          /* Estilos */
        
          table {
            width: 80%;
            border-collapse: collapse; 
            margin-bottom: 20px;
          }

          table, th, td {
            border: 1px solid black; 
            padding: 5px;
          }

          th {
            background-color: #dddddd; 
          }

          .contenedor {
            margin-top: 30px;
            text-align: center; 
          }
        
        .boton-volver-contenedor {
        margin: 40px 0;
        display: flex;
        justify-content: center;
        }
    
        .boton-volver {
        text-decoration: none;
        background-color: #1e293b;
        color: white;
        padding: 12px 25px;
        border-radius: 50px;
        font-weight: 500;
    }
        </style>
      </head>
      <body>
       <h1>FACTURA</h1>
        <p>Numero de factura: <xsl:value-of select="factura/@numero"/></p>
        <p>Fecha de emision: <xsl:value-of select="factura/@fecha"/></p>

    <div style="display: flex; justify-content: space-between; width: 80%; margin: 20px;">
    <div>
        <strong>DATOS EMISOR:</strong><br/>
        <xsl:value-of select="factura/emisor/nombre"/><br/>
        CIF: <xsl:value-of select="factura/emisor/cif"/><br/>
        Tel: <xsl:value-of select="factura/emisor/telefono"/>
    </div>
    <div>

        <strong>DATOS CLIENTE:</strong><br/>
        <xsl:value-of select="factura/cliente/nombre"/><br/>
        CIF: <xsl:value-of select="factura/cliente/cif"/><br/>
        Tel: <xsl:value-of select="factura/cliente/telefono"/>
    </div>
    </div>

<hr/>

    <h3>Detalle Factura:</h3>
    <table>
    <tr>
        <th>Código</th>
        <th>Tipo</th>
        <th>Descripción</th>
        <th>Cantidad</th>
        <th>Oferta</th>
        <th>PVP</th>
    </tr>
    <xsl:for-each select="factura/detalle/linea">
        <tr>
        <td><xsl:value-of select="@codigo"/></td>
        <td><xsl:value-of select="@tipo"/></td>
        <td><xsl:value-of select="descripcion"/></td>
        <td><xsl:value-of select="cantidad"/></td>
        <td>
            <xsl:choose>
            <xsl:when test="oferta">SI</xsl:when>
            <xsl:otherwise>NO</xsl:otherwise>
            </xsl:choose>
        </td>
        <td><xsl:value-of select="pvp"/></td>
        </tr>
    </xsl:for-each>
    </table>

    <div class="boton-volver-contenedor">
        <a href="../../index.html" class="boton-volver">Volver al index principal</a>
    </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>