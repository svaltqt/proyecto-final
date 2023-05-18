# Sistema híbrido MongoDB y PostgreSQL
Primero hay que instalar un entorno virtual para python
1. Primero debemos crear el entorno con [Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html)
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
4. Recuerda que todas estas intrucciones son en la carpeta donde estará el github, ya que el repo no viene con el entorno, pero vendrá con un ```requirements.txt``` que luego usaremos cuando ya tengamos el git clone hecho.
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