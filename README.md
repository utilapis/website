# Sitio web estático para Utilapis

### Requerimientos.
 - AWS CLI: https://aws.amazon.com/cli/
 - Make: https://www.gnu.org/software/make/

### Deploya un sitio web estático en AWS.
```
# Crear la infraestructura para el sitio web estático.
> make deploy

# Subir el sitio web estatico a S3.
> make subir

# Invalidar la cache de CloudFront.
> make invalidar

# Borrar la infraestructura para el sitio web estático
> make eliminar
```

### Video
- https://youtu.be/3vU9Jeyl5bs
