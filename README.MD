# Sistema híbrido MongoDB y PostgreSQL
1. Instalación de un entorno virtual para python
2. Instalación del repositorio Github
3. Instalación de dependencias

## Recomendaciones
[FastAPI](https://fastapi.tiangolo.com/es/#instalacion) Documentación e instalacion de FastAPI

# Entorno virtual con Conda
Para instalar el entorno virtual primero debemos ubicarnos en la carpeta donde descargaremos el repositorio y luego seguir los pasos:
1. Primero debemos crear el entorno virtual con [Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html).

En este caso el nombre del entorno será "proyecto-final"
```
    conda create --name proyecto-final python=3
```
2. Luego de ejecutar el comando en la terminal, se debe acceptar la creacion del entorno virtual
```
    Proceed ([y]/n)? y
```
3. Luego de haberse descargado los paquetes, es necesario activar el entorno de la siguiente manera:
```
    conda activate proyecto-final
```
4. Recuerda que todas estas intrucciones son en la carpeta donde estará el github, ya que el repo no viene con el entorno, pero vendrá con un ```requirements.txt``` que luego usaremos cuando ya tengamos instalado el entorno y descargado el git clone.
## Instalación del repositorio 
1. Git clone:
    ```
         git clone https://github.com/svaltqt/proyecto-final.git
    ```
2. Instalacion de Python Packages
    ``` 
         pip install -r requirements.txt
    ```
## Instalación postgres con DOCKER 
Para que funcione el postgres en un contenedor debes instalar Docker de la siguiente manera

1. Instalar [Docker](https://www.docker.com).
2. Correr el Docker-compose.yml en la terminal
    ```
         docker-compose up 
    ```

# Informe técnico
### Eleccion de una Base de datos que sea compatible con las necesidades del proyecto.

1. Este proyecto necesitaba una Base de datos rápida, escalable, flexible y con bajos costos.
2. Se requería de un sistema híbrido entre una Base de datos Relacional y una No Relacional.
3. Era necesario realizar consultas en la DB relacional para completar la información de la NoSQL

### Análisis

Se evaluaron diferentes tecnologías y soluciones NoSQL y se llegó a la conclusion de utilizar MongoDB
como la solucion de base de datos NoSQL para el proyecto.




